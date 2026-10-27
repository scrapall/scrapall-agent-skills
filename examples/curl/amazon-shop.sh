#!/usr/bin/env bash
# Amazon Shop: GET /v1/amazon/shop (Amazon Shop page)
# Usage: export SCRAPALL_API_KEY=your_key && bash amazon-shop.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/amazon/shop' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.amazon.com/shop/sydneydelrey'
