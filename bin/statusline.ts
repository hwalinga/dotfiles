#!/usr/bin/env npx tsx

/**
 * Statusline for Claude Code with two modes:
 *
 * 1. OpenRouter mode (ANTHROPIC_AUTH_TOKEN or ANTHROPIC_API_KEY set to an
 *    OpenRouter API key): tracks generation cost per session.
 *    Shows: Provider: model - $cost - cache discount: $saved
 *
 * 2. Subscription mode (no API key -- Claude Pro/Max account): shows the
 *    session (5-hour) and weekly (7-day) usage limits and when they reset,
 *    from the `rate_limits` field of the statusline stdin JSON.
 *    Shows: model - session 12% (resets 14:30) - week 40% (resets Mon 09:00)
 *
 * Setup: Add to your ~/.claude/settings.json:
 * {
 *   "statusLine": {
 *     "type": "command",
 *     "command": "/path/to/statusline.sh"
 *   }
 * }
 */

import { existsSync, readFileSync, writeFileSync } from 'node:fs';

interface GenerationData {
  total_cost: number;
  cache_discount: number | null;
  provider_name: string;
  model: string;
}

interface State {
  seen_ids: string[];
  total_cost: number;
  total_cache_discount: number;
  last_provider: string;
  last_model: string;
}

interface RateWindow {
  used_percentage: number;
  resets_at: number;
}

interface StatuslineInput {
  session_id?: string;
  transcript_path?: string;
  model?: { id: string; display_name: string };
  rate_limits?: {
    five_hour?: RateWindow;
    seven_day?: RateWindow;
    spend_limit?: RateWindow;
  };
  context_window?: { used_percentage: number | null };
}

async function fetchGeneration(id: string, apiKey: string): Promise<GenerationData | null> {
  try {
    const res = await fetch(`https://openrouter.ai/api/v1/generation?id=${id}`, {
      headers: {
        Authorization: `Bearer ${apiKey}`,
      },
    });

    if (!res.ok) {
      return null;
    }

    const json = await res.json();
    const data = json?.data;

    if (!data || typeof data.total_cost !== 'number') {
      return null;
    }

    return data;
  } catch {
    return null;
  }
}

function extractGenerationIds(transcriptPath: string): string[] {
  try {
    const content = readFileSync(transcriptPath, 'utf-8');
    const ids: string[] = [];

    for (const line of content.split('\n')) {
      if (!line.trim()) {
        continue;
      }
      try {
        const entry = JSON.parse(line);
        const messageId = entry?.message?.id;
        if (typeof messageId === 'string' && messageId.startsWith('gen-')) {
          ids.push(messageId);
        }
      } catch {
        // Skip malformed lines
      }
    }

    return [...new Set(ids)];
  } catch {
    return [];
  }
}

function loadState(statePath: string): State {
  const defaultState: State = {
    seen_ids: [],
    total_cost: 0,
    total_cache_discount: 0,
    last_provider: '',
    last_model: '',
  };

  if (!existsSync(statePath)) {
    return defaultState;
  }

  try {
    const content = readFileSync(statePath, 'utf-8');
    if (!content.trim()) {
      return defaultState;
    }

    const parsed = JSON.parse(content);

    // Validate state shape
    if (!Array.isArray(parsed.seen_ids)) {
      return defaultState;
    }

    return {
      seen_ids: parsed.seen_ids,
      total_cost: typeof parsed.total_cost === 'number' ? parsed.total_cost : 0,
      total_cache_discount:
        typeof parsed.total_cache_discount === 'number' ? parsed.total_cache_discount : 0,
      last_provider: typeof parsed.last_provider === 'string' ? parsed.last_provider : '',
      last_model: typeof parsed.last_model === 'string' ? parsed.last_model : '',
    };
  } catch {
    return defaultState;
  }
}

function saveState(statePath: string, state: State): void {
  writeFileSync(statePath, JSON.stringify(state, null, 2));
}

function shortModelName(model: string): string {
  return model.replace(/^[^/]+\//, '').replace(/-\d{8}$/, '');
}

async function openRouterStatusline(input: StatuslineInput, apiKey: string): Promise<void> {
  const session_id = input?.session_id;
  const transcript_path = input?.transcript_path;

  if (typeof session_id !== 'string' || typeof transcript_path !== 'string') {
    process.stdout.write('Invalid statusline input');
    return;
  }

  const statePath = `/tmp/claude-openrouter-cost-${session_id}.json`;
  const state = loadState(statePath);

  const allIds = extractGenerationIds(transcript_path);
  const seenSet = new Set(state.seen_ids);
  const newIds = allIds.filter((id) => !seenSet.has(id));

  let fetchFailed = 0;

  for (const id of newIds) {
    const gen = await fetchGeneration(id, apiKey);

    if (!gen) {
      fetchFailed++;
      continue;
    }

    state.total_cost += gen.total_cost ?? 0;
    state.total_cache_discount += gen.cache_discount ?? 0;

    if (gen.provider_name) {
      state.last_provider = gen.provider_name;
    }
    if (gen.model) {
      state.last_model = gen.model;
    }

    state.seen_ids.push(id);
  }

  saveState(statePath, state);

  const shortModel = shortModelName(state.last_model);
  let statusIndicator = '';
  if (newIds.length > 0) {
    const green = '\x1b[32m';
    const red = '\x1b[31m';
    const reset = '\x1b[0m';

    if (fetchFailed === 0) {
      statusIndicator = `\nusage tracking: ${green}up-to-date${reset}`;
    } else {
      statusIndicator = `\nusage tracking: ${red}behind${reset}`;
    }
  }

  if (state.last_provider) {
    process.stdout.write(
      `${state.last_provider}: ${shortModel} - $${state.total_cost.toFixed(4)} - cache discount: $${state.total_cache_discount.toFixed(2)}${statusIndicator}`,
    );
  } else {
    process.stdout.write(
      `$${state.total_cost.toFixed(4)} - cache discount: $${state.total_cache_discount.toFixed(2)}${statusIndicator}`,
    );
  }
}

function formatReset(epochSeconds: number): string {
  const d = new Date(epochSeconds * 1000);
  const now = new Date();
  const time = d.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });

  if (d.toDateString() === now.toDateString()) {
    return time;
  }
  const day = d.toLocaleDateString([], { weekday: 'short' });
  return `${day} ${time}`;
}

function colorPercent(pct: number): string {
  const reset = '\x1b[0m';
  const color = pct >= 90 ? '\x1b[31m' : pct >= 70 ? '\x1b[33m' : '\x1b[32m';
  return `${color}${pct.toFixed(0)}%${reset}`;
}

function window(label: string, w: RateWindow): string {
  return `${label} ${colorPercent(w.used_percentage)} (resets ${formatReset(w.resets_at)})`;
}

function subscriptionStatusline(input: StatuslineInput): void {
  const parts: string[] = [];

  const model = input?.model?.display_name;
  if (model) {
    parts.push(model);
  }

  const rl = input?.rate_limits;
  if (rl?.five_hour) {
    parts.push(window('session', rl.five_hour));
  }
  if (rl?.seven_day) {
    parts.push(window('week', rl.seven_day));
  }
  if (rl?.spend_limit) {
    parts.push(window('spend', rl.spend_limit));
  }

  const ctx = input?.context_window?.used_percentage;
  if (typeof ctx === 'number') {
    parts.push(`ctx ${ctx.toFixed(0)}%`);
  }

  if (!rl) {
    // rate_limits only appears after the first API response of a session
    parts.push('usage limits pending');
  }

  process.stdout.write(parts.join(' - '));
}

async function main(): Promise<void> {
  let inputData = '';
  for await (const chunk of process.stdin) {
    inputData += chunk;
  }

  let input: StatuslineInput;
  try {
    input = JSON.parse(inputData);
  } catch {
    process.stdout.write('Invalid statusline input');
    return;
  }

  const apiKey = process.env.ANTHROPIC_AUTH_TOKEN ?? process.env.ANTHROPIC_API_KEY ?? '';

  if (apiKey) {
    await openRouterStatusline(input, apiKey);
  } else {
    subscriptionStatusline(input);
  }
}

main().catch((err) => {
  process.stdout.write(`error: ${err.message}`);
});
