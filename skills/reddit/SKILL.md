---
name: scrapall-reddit
description: "Use when the user asks for public Reddit data (Post, Post Comments, Post Transcript, Search, Subreddit Details, Subreddit Posts, Subreddit Search). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# Reddit API skill

8 endpoints. Docs: https://scrapall.bipsport.com/docs/reddit/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/reddit/post?url=https://www.reddit.com/r/webscraping/comments/1q6pxwn/just_started_web_scraping_is_this_a_good_start/" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: paid plans (Free plan covers Facebook and Instagram only).

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/reddit/post` | Post | **`url`** | 1 |
| GET | `/v1/reddit/post_comments` | Post Comments | **`url`** | 1 |
| POST | `/v1/reddit/post_comments` | Post Comments | **`url`** | 1 |
| GET | `/v1/reddit/post_captions` | Post Transcript | **`url`**; optional: `language` | 1 |
| GET | `/v1/reddit/search` | Search | **`query`**; optional: `filter`, `sort`, `timeframe` | 1 |
| GET | `/v1/reddit/subreddit` | Subreddit Posts | **`subreddit`**; optional: `timeframe`, `sort`, `after` | 1 |
| GET | `/v1/reddit/subreddit_details` | Subreddit Details | optional: `subreddit`, `url` | 1 |
| GET | `/v1/reddit/subreddit_search` | Subreddit Search | **`subreddit`**; optional: `query`, `sort`, `timeframe` | 1 |

## Example agent workflow

Goal: "Find the 10 most recent items on Reddit for a given account or keyword and summarize what performs best."

1. Call `GET /v1/reddit/search` with the account or keyword the user gave.
2. Keep the 10 newest items. Paginate with the cursor field only if fewer than 10 came back.
3. For the top 3 items by engagement, call `GET /v1/reddit/post` for details.
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

- curl: `examples/curl/reddit.sh`
- Python: `examples/python/reddit.py`
- JavaScript: `examples/javascript/reddit.mjs`
