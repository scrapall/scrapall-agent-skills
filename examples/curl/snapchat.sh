#!/usr/bin/env bash
# Snapchat: GET /v1/snapchat/user (User Profile)
# Usage: export SCRAPALL_API_KEY=your_key && bash snapchat.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/snapchat/user' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'handle=zane'
