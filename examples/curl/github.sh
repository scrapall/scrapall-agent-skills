#!/usr/bin/env bash
# GitHub: GET /v1/github/repository (Repository)
# Usage: export SCRAPALL_API_KEY=your_key && bash github.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/github/repository' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://github.com/torvalds/linux'
