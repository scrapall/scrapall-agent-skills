#!/usr/bin/env bash
# LinkedIn: GET /v1/linkedin/company (Company Page)
# Usage: export SCRAPALL_API_KEY=your_key && bash linkedin.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/linkedin/company' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://linkedin.com/company/shopify'
