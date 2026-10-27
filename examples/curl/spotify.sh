#!/usr/bin/env bash
# Spotify: GET /v1/spotify/album (Album)
# Usage: export SCRAPALL_API_KEY=your_key && bash spotify.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/spotify/album' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'id=0pgrg7phBbnwGJ2HBEl9EG'
