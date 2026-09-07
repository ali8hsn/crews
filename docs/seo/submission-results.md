# Directory submissions

Status of every directory, awesome-list and registry Crews has been submitted to. Newest
activity first. Contact email is withheld here because this repository is public; it is
recorded in the private tracker.

| Directory | URL | Status | Last checked |
| --- | --- | --- | --- |
| punkpeye/awesome-mcp-servers | [PR #13844](https://github.com/punkpeye/awesome-mcp-servers/pull/13844) | **Open** — awaiting maintainer review | 2026-09-07 |
| mcpservers.org (wong2) | https://mcpservers.org/submit | Submitted 2026-09-06; awaiting approval. No public listing URL confirmed | 2026-09-07 |
| Glama | https://glama.ai/mcp/servers | Not submitted — account required, submission fields not yet seen | 2026-09-06 |
| Smithery | https://smithery.ai/new | Blocked — see below | 2026-09-06 |
| mcp.so | — | Skipped: paid placement | 2026-09-06 |
| PulseMCP | — | Skipped | 2026-09-06 |

## Details

### punkpeye/awesome-mcp-servers — open

PR #13844, opened 2026-09-07 by `ali8hsn`, titled "Add Crews MCP coordination server 🤖🤖🤖".
This became possible only once this documentation repository was made public;
[their CONTRIBUTING](https://github.com/punkpeye/awesome-mcp-servers/blob/main/CONTRIBUTING.md)
requires a repository link, and previously there was no public repository to give.

> **Needs a human look:** the emoji in the PR title are that list's markers for server
> attributes, not decoration. Confirm they match what Crews actually is before a maintainer
> reads it, and confirm the entry sits in the right category in alphabetical order.

### mcpservers.org — submitted

Their README directs contributors to the form rather than accepting PRs. Free submission,
premium unchecked, no fee paid. Confirmation received on submission; the site estimates
review within 12 hours and an email on approval, which is their estimate and not a
guarantee. A listing URL has not been confirmed — an attempt to read it returned HTTP 403 to
an automated fetch, which does not prove the page is absent.

Submitted fields: name Crews; category Development; repository/website
https://trycrews.com/install; premium unchecked.

### Glama — account required

Submission is behind Add Server, which requires an account. Post-login field labels are
unknown, so no claim is made about them.

> **Filter note:** Glama's spam filter reacts to the phrasings "hosted at" and "at domain".
> Do not use either in a description.

### Smithery — blocked on packaging, not on login

Sign-in is required, but the real blocker is downstream: the server URL field must be a
working public HTTPS MCP endpoint, not a marketing site. The current server uses stdio
transport. There is no verified Streamable HTTP endpoint (with OAuth if authentication is
required) and no prebuilt MCPB bundle, so there is no honest value to paste.

Documented routes out, per [Smithery's publish docs](https://smithery.ai/docs/build/publish):
a Streamable HTTP URL, or a local MCPB bundle. Logging in does not resolve this.

## Standard description

Use verbatim where a description is requested:

> MCP server for shared file state, overlap warnings, and messaging between AI coding agents
> working in parallel on one GitHub repo.
