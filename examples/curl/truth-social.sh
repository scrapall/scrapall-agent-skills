#!/usr/bin/env bash
# Truth Social: GET /v1/truthsocial/post (Post)
# Usage: export SCRAPALL_API_KEY=your_key && bash truth-social.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/truthsocial/post' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://truthsocial.com/@realDonaldTrump/posts/114315219437063160'
