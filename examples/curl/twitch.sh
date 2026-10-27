#!/usr/bin/env bash
# Twitch: GET /v1/twitch/clip (Clip)
# Usage: export SCRAPALL_API_KEY=your_key && bash twitch.sh
set -euo pipefail
: "${SCRAPALL_API_KEY:?Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)}"

curl -sS --get 'https://api.scrapall.bipsport.com/scapi/v1/twitch/clip' \
  -H "X-Scapi-Key: ${SCRAPALL_API_KEY}" \
  --data-urlencode 'url=https://www.twitch.tv/staryuuki/clip/CloudySavageMarjoramRuleFive--ErzsYbE7UWvgCMQ?filter=clips&range=all&sort=time'
