#!/usr/bin/env bash
# Cosmos: GET /v1/cosmos/cluster (Collection)
# Usage: export SCRAPALL_API_KEY=your_key && bash cosmos.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/cosmos/cluster' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.cosmos.so/design/the-best-band-posters'
