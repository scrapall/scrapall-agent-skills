#!/usr/bin/env bash
# Google Ad Library: GET /v1/google/ad (Ad Details)
# Usage: export SCRAPALL_API_KEY=your_key && bash google-ad-library.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/google/ad' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://adstransparency.google.com/advertiser/AR07541154843046445057/creative/CR17778900238552006657'
