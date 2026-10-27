#!/usr/bin/env bash
# Rumble: GET /v1/rumble/channel_videos (Channel Videos)
# Usage: export SCRAPALL_API_KEY=your_key && bash rumble.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/rumble/channel_videos' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'handle=CuteCats223'
