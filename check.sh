#!/usr/bin/env bash
# Validates menu.txt: fails on conflict markers or duplicate lines.
set -euo pipefail
if grep -qE '^(<<<<<<<|=======|>>>>>>>)' menu.txt; then
  echo "menu.txt contains a conflict marker" >&2
  exit 1
fi
if [ -n "$(sort menu.txt | uniq -d)" ]; then
  echo "menu.txt contains a duplicate line" >&2
  exit 1
fi
echo OK
