"""Rumble: GET /v1/rumble/channel_videos (Channel Videos).

Usage: pip install requests && export SCRAPALL_API_KEY=your_key && python3 rumble.py
"""
import json
import os
import sys

import requests

API = 'https://api.scrapall.bipsport.com/scapi'


def main():
    key = os.environ.get('SCRAPALL_API_KEY')
    if not key:
        sys.exit("Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)")
    r = requests.request('GET', API + '/v1/rumble/channel_videos', headers={'X-Scapi-Key': key},
                         params={"handle": "CuteCats223"}, timeout=60)
    if r.status_code != 200:
        sys.exit("HTTP %d: %s" % (r.status_code, r.text[:300]))
    print(json.dumps(r.json(), indent=2)[:2000])


if __name__ == "__main__":
    main()
