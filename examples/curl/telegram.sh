#!/usr/bin/env bash
# Telegram: GET /v1/telegram/channel (Channel Details)
# Usage: export SCRAPALL_API_KEY=your_key && bash telegram.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/telegram/channel' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'handle=telegram'
