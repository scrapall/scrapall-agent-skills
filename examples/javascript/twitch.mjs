// Twitch: GET /v1/twitch/clip (Clip)
// Usage (Node >= 18): export SCRAPALL_API_KEY=your_key && node twitch.mjs
const API = "https://api.scrapall.bipsport.com/scapi";
const key = process.env.SCRAPALL_API_KEY;
if (!key) {
  console.error("Set SCRAPALL_API_KEY first (get a key at https://scrapall.bipsport.com/account/)");
  process.exit(1);
}

const url = new URL(API + "/v1/twitch/clip");
for (const [k, v] of Object.entries({"url": "https://www.twitch.tv/staryuuki/clip/CloudySavageMarjoramRuleFive--ErzsYbE7UWvgCMQ?filter=clips&range=all&sort=time"})) url.searchParams.set(k, v);
const res = await fetch(url, { headers: { "X-Scapi-Key": key } });
if (!res.ok) {
  console.error(`HTTP ${res.status}: ${(await res.text()).slice(0, 300)}`);
  process.exit(1);
}
console.log(JSON.stringify(await res.json(), null, 2).slice(0, 2000));
