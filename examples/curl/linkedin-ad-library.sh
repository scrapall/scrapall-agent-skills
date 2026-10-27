#!/usr/bin/env bash
# LinkedIn Ad Library: GET /v1/linkedin/ad (Ad Details)
# Usage: export SCRAPALL_API_KEY=your_key && bash linkedin-ad-library.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/linkedin/ad' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.linkedin.com/ad-library/detail/666281156'
