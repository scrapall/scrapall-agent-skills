#!/usr/bin/env bash
# Pinterest: GET /v1/pinterest/board (Board)
# Usage: export SCRAPALL_API_KEY=your_key && bash pinterest.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/pinterest/board' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.pinterest.com/lizmrodgers/moms-night/'
