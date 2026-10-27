#!/usr/bin/env bash
# TikTok: GET /v1/tiktok/collection_videos (Collection Videos)
# Usage: export SCRAPALL_API_KEY=your_key && bash tiktok.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/tiktok/collection_videos' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.tiktok.com/@kibblemaster808/collection/Want-to-go-7665668414573546258'
