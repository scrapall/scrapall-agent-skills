#!/usr/bin/env bash
# Bluesky: GET /v1/bluesky/post (Post)
# Usage: export SCRAPALL_API_KEY=your_key && bash bluesky.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/bluesky/post' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://bsky.app/profile/espn.com/post/3lqdfq7fkvm2g'
