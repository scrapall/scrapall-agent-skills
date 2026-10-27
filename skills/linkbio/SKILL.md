---
name: scrapall-linkbio
description: "Use when the user asks for public Linkbio data (Linkbio page). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# Linkbio API skill

1 endpoint. Docs: https://scrapall.bipsport.com/docs/linkbio/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/linkbio/info?url=https://lnk.bio/msjennafischer" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: paid plans (Free plan covers Facebook and Instagram only).

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/linkbio/info` | Linkbio page | **`url`** | 1 |

## Example agent workflow

Goal: "Look up Linkbio data for the input the user gave and summarize it."

1. Call `GET /v1/linkbio/info` with the user input.
2. Extract the key fields and present them as a short table.
3. Stop on HTTP 402 and tell the user how many credits are needed.

## Errors

Error bodies look like `{"error": {"code": "...", "message": "..."}}`.

| HTTP | `error.code` | Meaning | Agent action |
|---|---|---|---|
| 401 | `invalid_key` | Missing or wrong X-Scapi-Key header | Check SCRAPALL_API_KEY; get a key at /account |
| 402 | `insufficient_credits` | Not enough credits left | Stop and ask the user to top up |
| 402 | `plan_expired` | Plan period ended | Ask the user to renew |
| 403 | `plan_restricted` | Free plan covers Facebook + Instagram only | Upgrade (buy_url in body) |
| 404 | `not_found` | Unknown path or method | Use a path from the table above |
| 429 | `rate_limited` | Too many requests | Back off (2s, 4s, 8s) and retry |
| 503 | `upstream_unavailable` | Temporary failure, not charged | Retry later |

## Examples

- curl: `examples/curl/linkbio.sh`
- Python: `examples/python/linkbio.py`
- JavaScript: `examples/javascript/linkbio.mjs`
