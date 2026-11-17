#!/usr/bin/env bash
set -euo pipefail

if (( $# > 1 )); then
  printf 'Usage: %s [git-ref]\n' "${0##*/}" >&2
  exit 2
fi

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
ref=${1:-HEAD}
commit=$(git -C "$repo_root" rev-parse --verify --end-of-options "${ref}^{commit}")
output="$repo_root/wizeprep-study.zip"
temporary_zip=$(mktemp "$repo_root/.wizeprep-study.XXXXXX")
trap 'rm -f -- "$temporary_zip"' EXIT

git -C "$repo_root" archive --format=zip --output="$temporary_zip" "$commit" -- \
  plugin.json mcp.json assets/icon.png README.md

# OpenAI limits the compressed ZIP to 100 MB.
max_bytes=100000000
size_bytes=$(wc -c < "$temporary_zip")
if (( size_bytes > max_bytes )); then
  printf 'ZIP exceeds the size limit (%d > %d bytes).\n' "$size_bytes" "$max_bytes" >&2
  exit 1
fi

unzip -tq "$temporary_zip"
unzip -Z -1 "$temporary_zip"
mv -f -- "$temporary_zip" "$output"
printf 'Built %s (%d bytes) from %s\n' "$output" "$size_bytes" "$commit"
