# Directory submissions

Status of every directory, awesome-list and registry Crews has been submitted to. Newest
activity first. Contact email is withheld here because this repository is public; it is
recorded in the private tracker.

| Directory | URL | Status | Last checked |
| --- | --- | --- | --- |
| punkpeye/awesome-mcp-servers | [PR #13844](https://github.com/punkpeye/awesome-mcp-servers/pull/13844) | **Open** — awaiting maintainer review | 2026-09-07 |
| mcpservers.org (wong2) | [Listing](https://mcpservers.org/servers/trycrews-com-install) | **Listed** — live, docs rendering from this repo | 2026-09-07 |
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

**Title emoji: verified correct, no change needed.** An earlier note here guessed that the
`🤖🤖🤖` were attribute markers. They are not — they are documented in
[CONTRIBUTING](https://github.com/punkpeye/awesome-mcp-servers/blob/main/CONTRIBUTING.md):
automated agents append `🤖🤖🤖` to the PR title to opt into a fast-tracked merge process.
The title is right as filed.

**One fix was pushed to the branch** ([a73d749](https://github.com/punkpeye/awesome-mcp-servers/pull/13844/commits)).
The entry read "...; hosted at trycrews.com with a free solo tier." That list is
[synced to the Glama directory](https://glama.ai/mcp/servers), and "hosted at" is one of the
phrasings Glama's spam filter reacts to. It now reads ". Free solo tier; team pricing in
preview."

Still worth a human eye: the entry carries no programming-language marker, where nearly every
neighbouring entry does, and it claims 🍎 🐧 but not 🪟. Both are easy to correct if Windows
is supported and the language is one you want stated publicly.

### mcpservers.org — listed and live

Their README directs contributors to the form rather than accepting PRs. Free submission,
premium unchecked, no fee paid.

The listing is live at
[mcpservers.org/servers/trycrews-com-install](https://mcpservers.org/servers/trycrews-com-install)
under Development. It originally showed "No documentation available" because its source was
the website rather than a repository; a request to switch the source to this repository was
sent on 7 September at 08:20 UTC and the maintainer replied "Updated" at 08:57 UTC. Verified
in a browser the same day: the page now renders this repository's README in full, and the
sidebar shows the GitHub repository as its source.

That host returns HTTP 403 to automated fetches, so this had to be checked in a real browser.
A 403 there is not evidence of absence.

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

## Update — 2026-09-07: both packaging blockers now have artifacts

The Glama and Smithery blockers were the same shape: neither lists a server without
something runnable. Two artifacts now exist in the Crews source repository, both running
Tower in remote-client mode against the hosted endpoint, both taking `CREWS_API_KEY` as
their only required variable, and neither needing a database:

- A root `Dockerfile`. Built and run locally: the container answers `initialize` and lists
  26 tools over stdio, and reaches `https://trycrews.com` (a deliberately wrong key returns
  `Unauthorized`, which is the hosted endpoint replying).
- `dist/crews.mcpb`, built by `bun run build:mcpb`. Verified under Node 22: same
  `initialize`, same 26 tools, same reply from the hosted endpoint.

Public documentation: [Docker](../run/docker.md), [MCPB bundle](../run/mcpb.md).

Two things this does **not** yet settle, both needing an operator decision:

1. **Glama indexes this public repository, which holds documentation only.** The Dockerfile
   lives in the private source repository, so a Glama build from `ali8hsn/crews` has nothing
   to build. Closing that means either publishing a prebuilt image to a public registry and
   pointing Glama at it, or putting a Dockerfile here that pulls that published image.
   Nothing has been submitted or published; no image has been pushed anywhere.
2. **Smithery's remote route is still shut.** Production `/mcp` authenticates with a Tower
   bearer token and Smithery requires OAuth for authenticated remote servers. The MCPB
   bundle is the way in, not the `/mcp` URL. The bundle has not been uploaded.

Known snag for whoever publishes the bundle: the manifest deliberately declares no `tools`
array, because the Smithery registry validates MCPB tool entries as full MCP `Tool` objects
and returns HTTP 400 once per tool declared
([smithery-ai/cli#787](https://github.com/smithery-ai/cli/issues/787), open). Clients read
the live tool list over stdio regardless.

## Standard description

Use verbatim where a description is requested:

> MCP server for shared file state, overlap warnings, and messaging between AI coding agents
> working in parallel on one GitHub repo.
