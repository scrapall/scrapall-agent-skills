#!/usr/bin/env bash
# TikTok Shop: GET /v1/tiktok/product (Product Details)
# Usage: export SCRAPALL_API_KEY=your_key && bash tiktok-shop.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/tiktok/product' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.tiktok.com/shop/pdp/goli-ashwagandha-gummies-with-vitamin-d-ksm-66-vegan-non-gmo/1729587769570529799'
