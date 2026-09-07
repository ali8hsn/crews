# External action log

Newest first. Every action that reached outside this repository is recorded here with its
URL. Read-only fetches are logged as well as writes, so the list can be audited end to end.

**No external write has been performed in this session.** No PR has been opened, no form
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
| ~08:3x | Added `docs/how-it-works.md`, `docs/faq.md`, `docs/compare/{README,raft,wormhole,cursor-origin,buzz}.md`, `LOG.md`, `docs/seo/submission-results.md`; expanded `README.md`, `llms.txt`, `CHANGELOG.md` |
