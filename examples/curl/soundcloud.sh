#!/usr/bin/env bash
# SoundCloud: GET /v1/soundcloud/artist (Artist)
# Usage: export SCRAPALL_API_KEY=your_key && bash soundcloud.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/soundcloud/artist' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'handle=kehlanimusic'
