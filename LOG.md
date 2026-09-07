# External action log

Newest first. Every action that reached outside this repository is recorded here with its
URL. Read-only fetches are logged as well as writes, so the list can be audited end to end.

**External writes so far: pushes to this repository's own `main`, and one commit to an
already-open pull request branch (see below).** No new PR has been opened, no form
submitted, no message posted, no email sent.

---

## 2026-09-07

### Reads — competitor and directory research

| Time (UTC) | Action | URL | Result |
| --- | --- | --- | --- |
| ~08:2x | Fetched, for `docs/compare/buzz.md` | https://www.ai.joaoqueiros.com/blog/buzz-agent-identity-vs-multi-agent-orchestration | 200, used |
| ~08:2x | Fetched, for `docs/compare/cursor-origin.md` | https://www.eesel.ai/blog/what-is-cursor-origin | 200, used |
| ~08:2x | Fetched via `gh`, for `docs/compare/wormhole.md` | https://github.com/fatmali/wormhole | 200, README read |
| ~08:2x | Fetched (official Origin post) | https://cursor.com/blog/origin | 404, not used |
| ~08:2x | Fetched (official Buzz post) | https://block.xyz/inside/introducing-buzz-where-humans-and-agents-work-together | fetcher parse error, cited but not read |
| ~08:2x | Fetched, for `docs/compare/raft.md` | https://raft.build/ | 200, used |
| ~08:2x | Fetched (Wormhole directory listing) | https://mcpservers.org/servers/fatmali/wormhole | 403, not used |
| ~08:2x | Fetched (own listing check) | https://mcpservers.org/servers/trycrews-com-install | 403, unverified |
| ~08:2x | Read via `gh` | https://github.com/punkpeye/awesome-mcp-servers/pull/13844 | OPEN, author ali8hsn, created 08:11 UTC |
| ~08:1x | Web searches (no URL fetched): "Cursor Origin", "Buzz", "Raft", "Wormhole", "Entire", "Befall" | — | see `docs/compare/` for what survived sourcing |
| ~08:0x | `git clone` | https://github.com/ali8hsn/crews | cloned to `~/crews-docs` |
| ~08:0x | `gh repo view` | https://github.com/ali8hsn/crews | PUBLIC, default branch `main` |
| ~08:0x | Gmail MCP `list_labels` (read-only) | — | connection verified, nothing read or sent |

### Writes to this repository

| Time (UTC) | Action |
| --- | --- |
| ~09:5x | **Writes** — four pushes to this repository's `main` (Windows notes, Befall caveat, sprint-item merge, posts 3–4) | https://github.com/ali8hsn/crews/commits/main | — |
| ~09:2x | Local read-only, private-repo worktree (no writes) | `crews-seo-landing/docs/seo/calendar/` | Content calendar briefs + weeks 1–2 full drafts |
| ~09:1x | Browser read (host 403s automated fetches) | https://mcpservers.org/servers/trycrews-com-install | Listing live; README rendering; Befall and Wormhole in Related Servers |
| ~09:1x | Gmail read-only sweep, last 7 days, directories + GitHub | — | One thread found: contact@mcpservers.org replied "Updated". Nothing sent |
| ~09:0x | **Write** — pushed commit `a73d749` to branch `add-crews` on the fork, updating PR #13844 | https://github.com/punkpeye/awesome-mcp-servers/pull/13844 | Removed "hosted at" phrasing per the Glama filter rule |
| ~09:0x | Read via `gh` — CONTRIBUTING and README legend | https://github.com/punkpeye/awesome-mcp-servers/blob/main/CONTRIBUTING.md | `🤖🤖🤖` confirmed as a documented agent opt-in marker |
| ~09:0x | Read via `gh`, for `docs/compare/befall.md` | https://github.com/esenbora/befall-mcp | 200, README read |
| ~09:0x | Read via `gh`, for `docs/compare/entire.md` | https://github.com/entireio/cli | 200, README read |
| ~09:0x | Fetched, for `docs/compare/entire.md` | https://entire.io | 200, used |
| ~08:4x | `git push origin main` → https://github.com/ali8hsn/crews/commit/8541775 |
| ~08:3x | Added `docs/how-it-works.md`, `docs/faq.md`, `docs/compare/{README,raft,wormhole,cursor-origin,buzz}.md`, `LOG.md`, `docs/seo/submission-results.md`; expanded `README.md`, `llms.txt`, `CHANGELOG.md` |
