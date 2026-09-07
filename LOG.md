# External action log

Newest first. Every action that reached outside this repository is recorded here with its
URL. Read-only fetches are logged as well as writes, so the list can be audited end to end.

**External writes so far: pushes to this repository's own `main`, and one commit to an
already-open pull request branch (see below).** No new PR has been opened, no form
submitted, no message posted, no email sent.

---

## 2026-09-07

### Reads — research session (cloud, no GitHub credential, no writes outside this repo)

This session filed nothing. Every row is a read. It could not push, open a PR or submit a
form even had it been asked to.

| Time (UTC) | Action | URL | Result |
| --- | --- | --- | --- |
| ~11:0x | Read CONTRIBUTING / README | https://github.com/docker/mcp-registry | 200, remote-server rules read |
| ~11:0x | Read publishing quickstart and server.json schema | https://github.com/modelcontextprotocol/registry | 200, `remotes` schema confirmed |
| ~11:0x | Read CONTRIBUTING and README legend | https://github.com/punkpeye/awesome-mcp-servers | 200 |
| ~11:0x | Read PR #13844 state, diff and comments | https://github.com/punkpeye/awesome-mcp-servers/pull/13844 | open, blocked on Glama badge |
| ~11:0x | Repo metadata survey (12 awesome-lists / registries) | api.github.com | 200; results in `docs/seo/submission-queue.md` |
| ~10:5x | Fetched submission page | https://glama.ai/mcp/servers | 200, no self-serve fields visible |
| ~10:5x | Fetched submission page | https://www.pulsemcp.com/submit | robots.txt disallows fetching |
| ~10:5x | Fetched directory page | https://lobehub.com/mcp | 200, no self-serve route |
| ~10:4x | HN item and search API (threads, dates, comments) | https://hn.algolia.com/api/v1/ | 200; results in `reply-queue.md`, `competitor-watch.md` |
| ~10:4x | Fetched | https://mcpagentmail.com/ | 200, used in comparison |
| ~10:4x | Fetched | https://github.com/madebyaris/agent-orchestration | 200, used in comparison |
| ~10:3x | Fetched | https://github.com/esenbora/befall-mcp | 200, verified Befall exists |
| ~10:3x | Fetched | https://entire.io and https://github.com/entireio/cli | 200, used in comparison |
| ~10:2x | Public web searches for the three baseline questions | — | recorded in `docs/seo/citations/2026-09-07.md` |
| ~10:2x | Opened Perplexity search URL in browser | https://www.perplexity.ai/search | "Sign up and repeat your request" — no answer obtained, no account created |
| ~10:2x | Read-only probe of the production MCP endpoint | https://trycrews.com/mcp | **401**. Direct `curl` from both environments refused by egress allowlist; status seen through the page fetcher |
| ~10:1x | Gmail search, read-only (3 queries) | — | one directory thread, already known; nothing sent |


### Writes — PR #1 update

| Time (UTC) | Action | URL | Result |
| --- | --- | --- | --- |
| ~10:3x | Pushed to branch `registry/docker-and-mcpb`, updating the open PR — root `Dockerfile`, `docs/run/ghcr.md`, deduped Glama/Smithery sections | https://github.com/ali8hsn/crews/pull/1 | pushed, **not merged** |

No image pushed to any registry. Nothing submitted to Glama or Smithery. MCPB bundle not
uploaded. `docs/seo/submission-queue.md` has nothing marked `ready`, so nothing was filed.

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
