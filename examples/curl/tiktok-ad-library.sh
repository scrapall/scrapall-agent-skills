#!/usr/bin/env bash
# TikTok Ad Library: GET /v1/tiktok/ads_ad (Ad Library Ad)
# Usage: export SCRAPALL_API_KEY=your_key && bash tiktok-ad-library.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/tiktok/ads_ad' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'ad_id=1869335220395266'
