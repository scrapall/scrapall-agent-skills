#!/usr/bin/env bash
# Reddit: GET /v1/reddit/post (Post)
# Usage: export SCRAPALL_API_KEY=your_key && bash reddit.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/reddit/post' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.reddit.com/r/webscraping/comments/1q6pxwn/just_started_web_scraping_is_this_a_good_start/'
