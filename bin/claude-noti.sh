#!/usr/bin/env bash
# claude_notify.sh
# Reads a Claude tool-use JSON event from stdin and pops a yad notification.
# Usage: echo '<json>' | ./claude_notify.sh "Claude has finished working"
 
prefix="$@"
 
msg=$(jq -r --arg prefix "$prefix" '"\($prefix): \(.tool_name)(\(.tool_input.command // .tool_input.file_path // ""))"')
 
yad \
  --text="$msg" \
  --title="Claude" \
  --notebook \
  --text-align=center
 
