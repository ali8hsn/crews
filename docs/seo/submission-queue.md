# Submission queue

**The gate for item 3.** The external session files only what appears here with status
`ready`, one per fire, and flips it to `filed` with a URL afterwards. Anything not in this
file does not get submitted — no exceptions, no judgement calls at filing time.

The drafting session proposes entries. A human, or the drafting session with the human's
say-so, marks one `ready`. That split is the point: research and authorisation are separate
steps, and the session that can push is not the session that decides what is worth pushing.

## Status values

| Status | Meaning |
| --- | --- |
| `candidate` | Found, not yet researched. Do not file. |
| `researched` | CONTRIBUTING read, scope confirmed to fit, entry text drafted. Still do not file. |
| `ready` | Approved for filing. The external session may take exactly one of these per fire. |
| `filed` | Submitted. Record the PR or confirmation URL and the date. |
| `skip` | Rejected. Record why, so it is not rediscovered next week. |

## Ready to file

*(none)*

Nothing is approved for filing right now, so nothing will be filed this fire.

## Filed

| Directory | URL | Date |
| --- | --- | --- |
| punkpeye/awesome-mcp-servers | [PR #13844](https://github.com/punkpeye/awesome-mcp-servers/pull/13844) | 2026-09-07 |
| mcpservers.org | [Listing](https://mcpservers.org/servers/trycrews-com-install) | 2026-09-06 |

Full detail on both, including the entry text and the open questions, is in
[submission-results.md](submission-results.md).

## Blocked — do not mark ready yet

| Directory | Blocker |
| --- | --- |
| Glama | Account needed, and `ghcr.io/ali8hsn/crews:latest` is not published. Submitting before the image is public gives a listing whose build fails. |
| Smithery | MCPB bundle built and verified but not uploaded; the remote route needs OAuth and production is bearer-token. |

## Skipped

| Directory | Reason |
| --- | --- |
| mcp.so | Paid placement. |
| PulseMCP | Skipped by instruction. |

## Entry template

Copy this per candidate. An entry without a fetched CONTRIBUTING link and a scope sentence
is not `researched`, whatever it says.

```
### <directory name>
- Status: candidate
- URL:
- CONTRIBUTING: <link actually fetched, and the date>
- Scope fits because: <one sentence quoting or citing their stated scope>
- Paid? no
- Entry text: <exactly what gets submitted; never "hosted at" or "at domain">
- Filed: —
```
