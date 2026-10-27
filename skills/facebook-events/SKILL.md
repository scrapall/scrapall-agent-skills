---
name: scrapall-facebook-events
description: "Use when the user asks for public Facebook Events data (Event Details, Events, Search Events). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# Facebook Events API skill

3 endpoints. Docs: https://scrapall.bipsport.com/docs/facebook-events/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/facebook/event_details?id=2255360061870188" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: included in the Free plan.

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/facebook/event_details` | Event Details | optional: `id`, `url` | 1 |
| GET | `/v1/facebook/events` | Events | **`url`**; optional: `time` | 1 |
| GET | `/v1/facebook/events_search` | Search Events | **`query`** | 1 |

## Example agent workflow

Goal: "Find the 10 most recent items on Facebook Events for a given account or keyword and summarize what performs best."

1. Call `GET /v1/facebook/events_search` with the account or keyword the user gave.
2. Keep the 10 newest items. Paginate with the cursor field only if fewer than 10 came back.
3. For the top 3 items by engagement, call `GET /v1/facebook/event_details` for details.
4. Report a table (link, date, engagement) plus 3 patterns worth copying. Cite every URL.
5. Budget check: estimate credits from the table above before looping; stop on HTTP 402.

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

- curl: `examples/curl/facebook-events.sh`
- Python: `examples/python/facebook-events.py`
- JavaScript: `examples/javascript/facebook-events.mjs`
