---
name: scrapall-creator-tools
description: "Use when the user asks for public Creator Tools data (Find Creator Emails, Find Social Profiles, Get Age and Gender). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# Creator Tools API skill

3 endpoints. Docs: https://scrapall.bipsport.com/docs/creator-tools/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/detect-age-gender/info?url=https://twitter.com/levelsio" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: paid plans (Free plan covers Facebook and Instagram only).

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/detect-age-gender/info` | Get Age and Gender | **`url`** | 1 |
| GET | `/v1/find-creator-emails/info` | Find Creator Emails | **`platform`, `handle`** | 1 (more with some params) |
| GET | `/v1/lookup/info` | Find Social Profiles | **`platform`, `handle`** | 10 |

## Example agent workflow

Goal: "Look up Creator Tools data for the input the user gave and summarize it."

1. Call `GET /v1/detect-age-gender/info` with the user input.
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

- curl: `examples/curl/creator-tools.sh`
- Python: `examples/python/creator-tools.py`
- JavaScript: `examples/javascript/creator-tools.mjs`
