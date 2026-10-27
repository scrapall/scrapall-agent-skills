#!/usr/bin/env bash
# Creator Tools: GET /v1/detect-age-gender/info (Get Age and Gender)
# Usage: export SCRAPALL_API_KEY=your_key && bash creator-tools.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/detect-age-gender/info' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://twitter.com/levelsio'
