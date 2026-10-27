#!/usr/bin/env bash
# Linkbio: GET /v1/linkbio/info (Linkbio page)
# Usage: export SCRAPALL_API_KEY=your_key && bash linkbio.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/linkbio/info' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://lnk.bio/msjennafischer'
