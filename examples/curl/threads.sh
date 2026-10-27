#!/usr/bin/env bash
# Threads: GET /v1/threads/post (Post)
# Usage: export SCRAPALL_API_KEY=your_key && bash threads.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/threads/post' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.threads.com/@trendspider/post/DIU8naHS6q_'
