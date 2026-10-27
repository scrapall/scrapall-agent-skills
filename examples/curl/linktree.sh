#!/usr/bin/env bash
# Linktree: GET /v1/linktree/info (Linktree page)
# Usage: export SCRAPALL_API_KEY=your_key && bash linktree.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/linktree/info' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://linktr.ee/miguelangeles'
