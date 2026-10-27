#!/usr/bin/env bash
# Kick: GET /v1/kick/clip (Clip)
# Usage: export SCRAPALL_API_KEY=your_key && bash kick.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/kick/clip' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://kick.com/xqc/clips/clip_01JGJHB6CEVFCQRYTVPM8DW892'
