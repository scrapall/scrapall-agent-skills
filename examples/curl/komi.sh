#!/usr/bin/env bash
# Komi: GET /v1/komi/info (Komi page)
# Usage: export SCRAPALL_API_KEY=your_key && bash komi.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/komi/info' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://kimkardashian.komi.io/'
