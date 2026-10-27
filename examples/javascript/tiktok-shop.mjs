// TikTok Shop: GET /v1/tiktok/product (Product Details)
// Usage (Node >= 18): export SCRAPALL_API_KEY=your_key && node tiktok-shop.mjs
const API = "https://api.scrapall.bipsport.com/scapi";
const key = process.env.SCRAPALL_API_KEY;
if (!key) {
  console.error("Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)");
  process.exit(1);
}

const url = new URL(API + "/v1/tiktok/product");
for (const [k, v] of Object.entries({"url": "https://www.tiktok.com/shop/pdp/goli-ashwagandha-gummies-with-vitamin-d-ksm-66-vegan-non-gmo/1729587769570529799"})) url.searchParams.set(k, v);
const res = await fetch(url, { headers: { "X-Scapi-Key": key } });
if (!res.ok) {
  console.error(`HTTP ${res.status}: ${(await res.text()).slice(0, 300)}`);
  process.exit(1);
}
console.log(JSON.stringify(await res.json(), null, 2).slice(0, 2000));
