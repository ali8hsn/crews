# Directory submissions

Status of every directory, awesome-list and registry Crews has been submitted to. Newest
activity first. Contact email is withheld here because this repository is public; it is
recorded in the private tracker.

| Directory | URL | Status | Last checked |
| --- | --- | --- | --- |
| punkpeye/awesome-mcp-servers | [PR #13844](https://github.com/punkpeye/awesome-mcp-servers/pull/13844) | **Open** — awaiting maintainer review | 2026-09-07 |
| mcpservers.org (wong2) | [Listing](https://mcpservers.org/servers/trycrews-com-install) | **Listed** — live, docs rendering from this repo | 2026-09-07 |
| Glama | https://glama.ai/mcp/servers | Not submitted — account required, and blocked until the GHCR image is public | 2026-09-07 |
| Smithery | https://smithery.ai/new | Not submitted — MCPB bundle built and verified, not uploaded | 2026-09-07 |
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

### Glama — needs the published image

Two things gate this, and only one of them is an account.

**Account.** Submission is behind Add Server, which requires a sign-up. Post-login field
labels have not been seen, so no claim is made about them. The listing copy above is ready
to paste.

**The image.** Glama needs a Dockerfile it can build, and its own bot is explicit about the
bar: *"you must add Dockerfile directly to Glama. For checks to pass, we only need the server
to start and respond to introspection requests"*
([glama-check on PR #13844](https://github.com/punkpeye/awesome-mcp-servers/pull/13844)).
The real multi-stage Dockerfile lives in the private source repository, so there was nothing
to give it.

A thin root `Dockerfile` now sits in this repository:

    FROM ghcr.io/bmp0404/crews:latest

It re-exports the published image rather than pretending to build one. See
[docs/run/ghcr.md](../run/ghcr.md).

**This does not work yet.** `ghcr.io/bmp0404/crews:latest` does not resolve — the image has
not been published. Until it is, the Dockerfile fails to build and the listing would be worse
than no listing. Do not submit to Glama before the image is public.

**This is now on the critical path for more than Glama.** PR #13844 on
punkpeye/awesome-mcp-servers no longer merges on review alone: the `glama-check` bot requires
a Glama listing that passes checks, plus a Glama score badge added to the entry. So Glama
gates the awesome-list entry too, and the awesome-list is the larger prize.

**Second route worth weighing.** The same bot notes: *"If your server already has a hosted
endpoint, you can also list it under https://glama.ai/mcp/connectors."* Production does serve
`/mcp`. That route may not need the image at all — it has not been investigated, and it
should be before anyone waits on a container publish.

Nothing has been submitted. No image has been pushed to any registry.

> **Filter note:** Glama's spam filter reacts to the phrasings "hosted at" and "at domain".
> Do not use either in a description.

### Smithery — blocked on the auth scheme, not the transport

**Correction to an earlier entry here.** This section previously said "the current server
uses stdio transport. There is no verified Streamable HTTP endpoint." That was wrong, and it
was wrong because it was read off the source tree instead of production.

Production serves Streamable HTTP at `https://trycrews.com/mcp`. An unauthenticated `GET`
returns **401, not 404** — the endpoint is live and authenticating. The route is
`app.all("/mcp", bearerAuth, createMcpHandler())`: a **bearer token**, not OAuth.

*Provenance, since this is the claim that was wrong once already:* the 401 came through a
page fetcher, because `trycrews.com` was not on the egress allowlist of the session that
checked it and `curl` was blocked. Anyone re-checking from a session with the domain
allowlisted should read the `WWW-Authenticate` header and settle it properly.

So the blocker is the auth scheme. Per
[Smithery's publish docs](https://smithery.ai/docs/build/publish), an authenticating remote
endpoint must use OAuth; otherwise the server ships as a prebuilt **MCPB bundle**. The
options are:

1. put an OAuth authorization-server path in front of `/mcp`, keeping bearer for existing
   clients;
2. **ship the MCPB bundle** — cheaper, and it does not touch the running service; or
3. mark Smithery "won't do" rather than leaving it pending.

**The MCPB bundle is the path.** `dist/crews.mcpb`, built by `bun run build:mcpb`, has been
verified under Node 22: it answers `initialize`, lists 26 tools, and reaches the hosted
endpoint (a deliberately wrong key returns `Unauthorized`, which is the endpoint replying).
Documentation: [MCPB bundle](../run/mcpb.md). **It has not been uploaded.**

Known snag for whoever uploads it: the manifest deliberately declares no `tools` array,
because the Smithery registry validates MCPB tool entries as full MCP `Tool` objects and
returns HTTP 400 once per declared tool
([smithery-ai/cli#787](https://github.com/smithery-ai/cli/issues/787), open). Clients read
the live tool list over stdio regardless. Do not "fix" the manifest by adding the array.

### A rule earned the hard way

When a claim depends on what production does, check production, not the source tree. The
stdio error above cost a wrong entry in this file and a wrong sprint item in
`.crews/messages/seo-loop.md`.

## Standard description

Use verbatim where a description is requested:

> MCP server for shared file state, overlap warnings, and messaging between AI coding agents
> working in parallel on one GitHub repo.
