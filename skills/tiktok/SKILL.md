---
name: scrapall-tiktok
description: "Use when the user asks for public TikTok data (Collection Videos, Comment Replies, Comments, Followers, Following, Get Song Details, Live, Live Info, Profile, Profile Region, Profile Videos, Search Suggestions, Search Users, Search by Hashtag, Search by Keyword, TikT). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# TikTok API skill

21 endpoints. Docs: https://scrapall.bipsport.com/docs/tiktok/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/tiktok/collection_videos?url=https://www.tiktok.com/@kibblemaster808/collection/Want-to-go-7665668414573546258" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: paid plans (Free plan covers Facebook and Instagram only).

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/tiktok/collection_videos` | Collection Videos | **`url`** | 1 |
| GET | `/v1/tiktok/get_trending_feed` | Trending Feed | **`region`** | 1 |
| GET | `/v1/tiktok/live` | Live Info | **`room_id`, `user_id`** | 1 |
| GET | `/v1/tiktok/user` | Profile | optional: `handle`, `user_id` | 1 |
| GET | `/v1/tiktok/user_region` | Profile Region | **`handle`** | 1 |
| GET | `/v1/tiktok/search_hashtag` | Search by Hashtag | **`hashtag`**; optional: `region` | 1 |
| GET | `/v1/tiktok/search_keyword` | Search by Keyword | **`query`**; optional: `date_posted`, `sort_by`, `region` | 1 |
| GET | `/v1/tiktok/search_suggestions` | Search Suggestions | **`query`**; optional: `region` | 1 |
| GET | `/v1/tiktok/search_top` | Top Search | **`query`**; optional: `publish_time`, `sort_by`, `region` | 1 |
| GET | `/v1/tiktok/search_users` | Search Users | **`query`** | 1 |
| GET | `/v1/tiktok/song` | Get Song Details | **`clip_id`** | 1 |
| GET | `/v1/tiktok/song_videos` | TikToks using Song | optional: `clip_id` | 1 |
| GET | `/v1/tiktok/user_audience` | User's Audience Demographics | **`handle`** | 26 |
| GET | `/v1/tiktok/user_followers` | Followers | optional: `handle`, `user_id`, `min_time` | 1 |
| GET | `/v1/tiktok/user_following` | Following | **`handle`**; optional: `min_time` | 1 |
| GET | `/v1/tiktok/user_live` | Live | **`handle`** | 1 |
| GET | `/v1/tiktok/video_comment_replies` | Comment Replies | **`comment_id`, `url`** | 1 |
| GET | `/v1/tiktok/video_comments` | Comments | **`url`** | 1 |
| GET | `/v1/tiktok/video_captions` | Transcript | **`url`**; optional: `language`, `allow_long_transcription`, `use_ai_as_fallback` | 1 (more with some params) |
| GET | `/v1/tiktok/video_plus` | Video Info | **`url`**; optional: `region`, `get_transcript`, `download_media` | 1 |
| GET | `/v1/tiktok/user_videos_pro` | Profile Videos | **`handle`**; optional: `user_id`, `sort_by`, `region` | 1 |

## Example agent workflow

Goal: "Find the 10 most recent items on TikTok for a given account or keyword and summarize what performs best."

1. Call `GET /v1/tiktok/collection_videos` with the account or keyword the user gave.
2. Keep the 10 newest items. Paginate with the cursor field only if fewer than 10 came back.
3. For the top 3 items by engagement, call `GET /v1/tiktok/get_trending_feed` for details.
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

- curl: `examples/curl/tiktok.sh`
- Python: `examples/python/tiktok.py`
- JavaScript: `examples/javascript/tiktok.mjs`
