#!/usr/bin/env bash
# Linkme: GET /v1/linkme/info (Profile)
# Usage: export SCRAPALL_API_KEY=your_key && bash linkme.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/linkme/info' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://link.me/danucd'
