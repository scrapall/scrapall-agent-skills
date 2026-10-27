#!/usr/bin/env bash
# Facebook Ad Library: GET /v1/facebook/ads_ad (Ad Details)
# Usage: export SCRAPALL_API_KEY=your_key && bash facebook-ad-library.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/facebook/ads_ad' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'id=1287846322525076'
