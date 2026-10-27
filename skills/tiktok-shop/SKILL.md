---
name: scrapall-tiktok-shop
description: "Use when the user asks for public TikTok Shop data (Product Details, Product Reviews, Shop Products, Shop Search, User Showcase). Calls the Scrapall REST API with the X-Scapi-Key header."
---

# TikTok Shop API skill

5 endpoints. Docs: https://scrapall.bipsport.com/docs/tiktok-shop/

## Auth

Send your key in the `X-Scapi-Key` header on every request. Read it from the `SCRAPALL_API_KEY` environment variable; never hard-code it.

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/tiktok/product?url=https://www.tiktok.com/shop/pdp/goli-ashwagandha-gummies-with-vitamin-d-ksm-66-vegan-non-gmo/1729587769570529799" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Plan access: paid plans (Free plan covers Facebook and Instagram only).

## Endpoints

| Method | Path | What it does | Params (**required**) | Credits/call |
|---|---|---|---|---|
| GET | `/v1/tiktok/product` | Product Details | **`url`**; optional: `region` | 1 |
| GET | `/v1/tiktok/shop_product_reviews` | Product Reviews | optional: `url`, `product_id`, `region` | 1 |
| GET | `/v1/tiktok/shop_products` | Shop Products | **`url`**; optional: `sort_by`, `region` | 1 |
| GET | `/v1/tiktok/shop_search` | Shop Search | **`query`**; optional: `region`, `page` | 1 |
| GET | `/v1/tiktok/user_showcase` | User Showcase | **`handle`**; optional: `region` | 1 |

## Example agent workflow

Goal: "Find the 10 most recent items on TikTok Shop for a given account or keyword and summarize what performs best."

1. Call `GET /v1/tiktok/shop_search` with the account or keyword the user gave.
2. Keep the 10 newest items. Paginate with the cursor field only if fewer than 10 came back.
3. For the top 3 items by engagement, call `GET /v1/tiktok/product` for details.
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

- curl: `examples/curl/tiktok-shop.sh`
- Python: `examples/python/tiktok-shop.py`
- JavaScript: `examples/javascript/tiktok-shop.mjs`
