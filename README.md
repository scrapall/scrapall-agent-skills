# Scrapall Agent Skills

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) [![GitHub stars](https://img.shields.io/github/stars/privatealbum1/scrapall-agent-skills?style=social)](https://github.com/privatealbum1/scrapall-agent-skills/stargazers) [![Website](https://img.shields.io/badge/website-scrapall-blue)](https://scrapall.bipsport.com/)

> Realtime data for your Agent. Drop-in skills that let Claude Code, Cursor, Codex and Hermes pull public data from 37 platforms through one REST API: https://scrapall.bipsport.com/

**Star this repo -> +20 free credits.** Details [below](#star--get-free-credits).

## Quick start

1. Sign in at https://scrapall.bipsport.com/account/ - the Free plan gives you **20 credits** right away (Facebook + Instagram endpoints).
2. Copy your API key and export it:

```bash
export SCRAPALL_API_KEY=your_key
```

3. Make your first call:

```bash
curl -sS "https://api.scrapall.bipsport.com/scapi/v1/instagram/basic_profile?user_id=314216" -H "X-Scapi-Key: $SCRAPALL_API_KEY"
```

Every request authenticates with the `X-Scapi-Key` header. Responses are JSON.

## Platforms

192 endpoints across 37 groups. Each skill lists every endpoint with required params and credits per call.

| Platform | Endpoints | Skill | Docs |
|---|---|---|---|
| Amazon Shop | 1 | [skills/amazon-shop](skills/amazon-shop/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/amazon-shop/) |
| Apple Music | 4 | [skills/apple-music](skills/apple-music/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/apple-music/) |
| Bluesky | 3 | [skills/bluesky](skills/bluesky/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/bluesky/) |
| Scrapall | 1 | [skills/scrapall](skills/scrapall/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/scrapall/) |
| Cosmos | 7 | [skills/cosmos](skills/cosmos/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/cosmos/) |
| Creator Tools | 3 | [skills/creator-tools](skills/creator-tools/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/creator-tools/) |
| Facebook | 12 | [skills/facebook](skills/facebook/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/facebook/) |
| Facebook Ad Library | 7 | [skills/facebook-ad-library](skills/facebook-ad-library/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/facebook-ad-library/) |
| Facebook Events | 3 | [skills/facebook-events](skills/facebook-events/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/facebook-events/) |
| Facebook Marketplace | 3 | [skills/facebook-marketplace](skills/facebook-marketplace/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/facebook-marketplace/) |
| GitHub | 10 | [skills/github](skills/github/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/github/) |
| Google | 1 | [skills/google](skills/google/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/google/) |
| Google Ad Library | 3 | [skills/google-ad-library](skills/google-ad-library/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/google-ad-library/) |
| Instagram | 19 | [skills/instagram](skills/instagram/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/instagram/) |
| Kick | 1 | [skills/kick](skills/kick/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/kick/) |
| Komi | 1 | [skills/komi](skills/komi/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/komi/) |
| Kwai | 3 | [skills/kwai](skills/kwai/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/kwai/) |
| Linkbio | 1 | [skills/linkbio](skills/linkbio/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/linkbio/) |
| LinkedIn | 6 | [skills/linkedin](skills/linkedin/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/linkedin/) |
| LinkedIn Ad Library | 2 | [skills/linkedin-ad-library](skills/linkedin-ad-library/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/linkedin-ad-library/) |
| Linkme | 1 | [skills/linkme](skills/linkme/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/linkme/) |
| Linktree | 1 | [skills/linktree](skills/linktree/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/linktree/) |
| Pinterest | 4 | [skills/pinterest](skills/pinterest/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/pinterest/) |
| Reddit | 8 | [skills/reddit](skills/reddit/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/reddit/) |
| Rumble | 5 | [skills/rumble](skills/rumble/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/rumble/) |
| Snapchat | 3 | [skills/snapchat](skills/snapchat/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/snapchat/) |
| SoundCloud | 3 | [skills/soundcloud](skills/soundcloud/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/soundcloud/) |
| Spotify | 7 | [skills/spotify](skills/spotify/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/spotify/) |
| Telegram | 3 | [skills/telegram](skills/telegram/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/telegram/) |
| Threads | 5 | [skills/threads](skills/threads/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/threads/) |
| TikTok | 21 | [skills/tiktok](skills/tiktok/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/tiktok/) |
| TikTok Ad Library | 2 | [skills/tiktok-ad-library](skills/tiktok-ad-library/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/tiktok-ad-library/) |
| TikTok Shop | 5 | [skills/tiktok-shop](skills/tiktok-shop/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/tiktok-shop/) |
| Truth Social | 3 | [skills/truth-social](skills/truth-social/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/truth-social/) |
| Twitch | 5 | [skills/twitch](skills/twitch/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/twitch/) |
| Twitter | 7 | [skills/twitter](skills/twitter/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/twitter/) |
| YouTube | 18 | [skills/youtube](skills/youtube/SKILL.md) | [docs](https://scrapall.bipsport.com/docs/youtube/) |

## Install the skills in your agent

Clone the repo, then copy (or symlink) the folders you need from `skills/` into the skills directory your agent reads:

```bash
git clone https://github.com/privatealbum1/scrapall-agent-skills.git
```

- **Claude Code**: put each `skills/<platform>/` folder in your personal or project skills directory (for example `~/.claude/skills/` or `.claude/skills/` inside the project).
- **Cursor**: add the `SKILL.md` files to your project rules / agent context folder, or reference them from your rules.
- **Codex**: reference the skill files from your project `AGENTS.md` so the agent reads them.
- **Hermes Agent**: copy the folders into your Hermes skills directory and load one with `skill_view(name=...)`.

## Star & get free credits

1. Star this repo: https://github.com/privatealbum1/scrapall-agent-skills
2. Sign in at https://scrapall.bipsport.com/account/ and connect your GitHub account.
3. **+20 credits** are added to your balance (once per account).

## Pricing

Credits per call are listed in each skill table. Full details: https://scrapall.bipsport.com/pricing/

| Plan | Price | Credits | Access |
|---|---|---|---|
| Free | $0 | 20 on signup, +20 per GitHub star | Facebook + Instagram endpoints |
| Freelance | $45 / 30 days | 27,000 / period (~$1.67 per 1,000 calls) | All endpoints |
| Business | $499 / 30 days | 500,000 / period (~$1.00 per 1,000 calls) | All endpoints |

## Errors

Errors return JSON like `{"error": {"code": "insufficient_credits", "message": "..."}}`. Each `SKILL.md` lists the codes and what the agent should do.

## Support

- Website: https://scrapall.bipsport.com/
- Docs: https://scrapall.bipsport.com/docs/
- Telegram: rajoulzsannax123
- Issues: https://github.com/privatealbum1/scrapall-agent-skills/issues

## License

MIT - see [LICENSE](LICENSE).
