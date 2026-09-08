#!/usr/bin/env bash
# claude_notify.sh
# Reads a Claude tool-use JSON event from stdin and pops a yad notification.
# Usage: echo '<json>' | ./claude_notify.sh "Claude has finished working"

set -euo pipefail

prefix="$*"

msg=$(jq -r --arg prefix "$prefix" '
  (.tool_input.command // .tool_input.file_path // "") as $arg
  | if .tool_name then
      "\($prefix): \(.tool_name)" + (if $arg == "" then "" else "(\($arg))" end)
    else
      $prefix
    end
') || msg="$prefix"

[[ -n $msg ]] || msg="$prefix"

yad \
  --text="$msg" \
  --title="Claude" \
  --text-align=center \
