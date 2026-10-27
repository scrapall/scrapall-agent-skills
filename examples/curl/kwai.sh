#!/usr/bin/env bash
# Kwai: GET /v1/kwai/post (Post)
# Usage: export SCRAPALL_API_KEY=your_key && bash kwai.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/kwai/post' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.kwai.com/@KwaiBrasilOficial/photo/5193363430624671876'
