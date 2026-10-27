#!/usr/bin/env bash
# Twitter: GET /v1/twitter/community (Community)
# Usage: export SCRAPALL_API_KEY=your_key && bash twitter.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/twitter/community' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://x.com/i/communities/1926186499399139650'
