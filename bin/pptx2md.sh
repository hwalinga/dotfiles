#!/usr/bin/env bash

# exit on error or use of undeclared variable or pipe error:
set -o errtrace -o errexit -o nounset -o pipefail
# optionally debug output by supplying TRACE=1
[[ "${TRACE:-0}" == "1" ]] && set -o xtrace

shopt -s inherit_errexit
IFS=$'\n\t'
PS4='+\t '

error_handler() { echo "Error: In ${BASH_SOURCE[0]} Line ${1} exited with Status ${2}"; }
trap 'error_handler ${LINENO} $?' ERR

output_file="$(mktemp "${TMPDIR:-/tmp}/tempXXXXXXXXXX.md")"
  clean_up() {
    rm "$output_file"
  }
  trap clean_up EXIT

# Get the last argument
for arg; do :; done
# Check if the last argument is a single hyphen
if [ "$arg" = "-" ]; then
  input_file="$(mktemp "${TMPDIR:-/tmp}/tempXXXXXXXXXX.pptx")"
  clean_up() {
    rm "$input_file"
  }
  trap clean_up EXIT
  cat > "$input_file"

  if [ $# -gt 1 ]; then
    # Store all arguments in an array
    args=("$@")
    # Remove the last element from the array
    unset "args[${#args[@]}-1]"
    pptx2md ${args[*]} "$input_file" --output "$output_file" >/dev/null && \
      cat --squeeze-blank "$output_file"
  else
    pptx2md "$input_file" --output "$output_file" >/dev/null &&
      cat --squeeze-blank "$output_file"
  fi
else
  pptx2md "$@" --output "$output_file" &&
    cat --squeeze-blank "$output_file"
fi
