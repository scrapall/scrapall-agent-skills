#!/usr/bin/env bash
# Instagram: GET /v1/instagram/audio_reels (Get Reels By Audio Id)
# Usage: export SCRAPALL_API_KEY=your_key && bash instagram.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/instagram/audio_reels' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'audio_id=1392969992841787'
