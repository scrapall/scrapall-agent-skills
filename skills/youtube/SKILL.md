---
name: scrapall-youtube
description: "Use when the user asks for public YouTube data (Channel Community Posts, Channel Details, Channel Lives, Channel Playlists, Channel Search, Channel Shorts, Channel Videos, Comment Replies, Comments, Community Post Details, Playlist, Search, Search Typeahead, Search by). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# YouTube API skill

18 endpoints. Docs: https://scrapall.bipsport.com/docs/youtube/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/youtube/channel?channel_id=UC-9-kyTW8ZkZNDHQJ6FgpwQ" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: paid plans (Free plan covers Facebook and Instagram only).

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/youtube/channel` | Channel Details | optional: `channel_id`, `handle`, `url` | 1 |
| GET | `/v1/youtube/channel_videos` | Channel Videos | optional: `channel_id`, `handle`, `sort` | 1 |
| GET | `/v1/youtube/channel_community_posts` | Channel Community Posts | optional: `channel_id`, `handle` | 1 |
| GET | `/v1/youtube/channel_lives` | Channel Lives | optional: `channel_id`, `handle` | 1 |
| GET | `/v1/youtube/channel_playlists` | Channel Playlists | optional: `channel_id`, `handle` | 1 |
| GET | `/v1/youtube/channel_search` | Channel Search | **`handle`, `query`** | 1 |
| GET | `/v1/youtube/channel_shorts` | Channel Shorts | optional: `handle`, `channel_id`, `sort` | 1 |
| GET | `/v1/youtube/community_post` | Community Post Details | **`url`** | 1 |
| GET | `/v1/youtube/playlist` | Playlist | **`playlist_id`** | 1 |
| GET | `/v1/youtube/search` | Search | **`query`**; optional: `upload_date`, `sort_by`, `type` | 1 |
| GET | `/v1/youtube/search_hashtag` | Search by Hashtag | **`hashtag`**; optional: `type` | 1 |
| GET | `/v1/youtube/search_typeahead` | Search Typeahead | **`query`** | 1 |
| GET | `/v1/youtube/shorts_trending` | Trending Shorts | - | 1 |
| GET | `/v1/youtube/video` | Video/Short Details | **`url`**; optional: `language` | 1 |
| GET | `/v1/youtube/video_comment_replies` | Comment Replies | **`next_cursor_token`** | 1 |
| GET | `/v1/youtube/video_comments` | Comments | **`url`**; optional: `order` | 1 |
| GET | `/v1/youtube/video_sponsors` | Video Sponsors | **`url`**; optional: `language` | 1 |
| GET | `/v1/youtube/video_captions` | Transcript | **`url`**; optional: `language`, `original_audio` | 1 |

## Example agent workflow

Goal: "Find the 10 most recent items on YouTube for a given account or keyword and summarize what performs best."

1. Call `GET /v1/youtube/channel_videos` with the account or keyword the user gave.
2. Keep the 10 newest items. Paginate with the cursor field only if fewer than 10 came back.
3. For the top 3 items by engagement, call `GET /v1/youtube/channel` for details.
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

- curl: `examples/curl/youtube.sh`
- Python: `examples/python/youtube.py`
- JavaScript: `examples/javascript/youtube.mjs`
