#!/usr/bin/env bash
# Facebook Events: GET /v1/facebook/event_details (Event Details)
# Usage: export SCRAPALL_API_KEY=your_key && bash facebook-events.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/facebook/event_details' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'id=2255360061870188'
