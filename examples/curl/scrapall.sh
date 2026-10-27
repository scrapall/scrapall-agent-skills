#!/usr/bin/env bash
# Scrapall: GET /v1/usage/balance (Get credit balance)
# Usage: export SCRAPALL_API_KEY=your_key && bash scrapall.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/usage/balance' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}"
