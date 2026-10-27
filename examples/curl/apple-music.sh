#!/usr/bin/env bash
# Apple Music: GET /v1/apple-music/album (Album)
# Usage: export SCRAPALL_API_KEY=your_key && bash apple-music.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/apple-music/album' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'id=1468058165'
