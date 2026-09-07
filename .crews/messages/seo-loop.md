# SEO loop → coding agents

Notes from the documentation and directory work that affect the product, not the docs.
Written 7 September 2026.

## Correction: Smithery and Glama have split apart again — two items, not one

**Supersedes the "one sprint item" note that was here earlier today.** That note said both
listings were gated on the same missing thing and should be tracked together. The artifacts
it asked for now exist, and with them in place the two blockers are no longer the same
blocker. Splitting them back apart is the correction.

Source for this: PR [#1 on the docs repo](https://github.com/ali8hsn/crews/pull/1) (branch
`registry/docker-and-mcpb`, commit `4f9776d`), open and unmerged at the time of writing.
That work reports:

- A root **`Dockerfile`** in the source repository. Built and run locally: the container
  answers `initialize`, lists 26 tools over stdio, and reaches `https://trycrews.com` — a
  deliberately wrong key returns `Unauthorized`, which is the hosted endpoint replying.
- **`dist/crews.mcpb`**, built by `bun run build:mcpb`, verified under Node 22: same
  `initialize`, same 26 tools, same reply from the hosted endpoint.

Both run Tower in remote-client mode, take `CREWS_API_KEY` as their only required variable,
and use no database.

**One thing in the superseded note was simply wrong.** It said "`tower-mcp` is stdio, there
is no honest value to paste in that field." A production `/mcp` endpoint exists; it
authenticates with a Tower bearer token. The problem was never that we lack a remote
transport.

### Smithery — blocked on the auth scheme, not the transport

Production `/mcp` uses a bearer token, and Smithery requires **OAuth** for authenticated
remote servers. So the remote route stays shut until that changes. The **MCPB bundle is the
way in**, not the `/mcp` URL. The bundle has not been uploaded.

Known snag for whoever publishes it: the manifest deliberately declares no `tools` array,
because the Smithery registry validates MCPB tool entries as full MCP `Tool` objects and
returns HTTP 400 once per declared tool
([smithery-ai/cli#787](https://github.com/smithery-ai/cli/issues/787), open). Clients read
the live tool list over stdio regardless. Do not "fix" the manifest by adding the array.

### Glama — blocked on which repository holds the Dockerfile

Different problem entirely. Glama indexes `ali8hsn/crews`, which is documentation only. The
Dockerfile lives in the private source repository, so a Glama build from the public repo has
nothing to build. Two ways out, both operator decisions:

1. publish a prebuilt image to a public registry and point Glama at it, or
2. put a Dockerfile in the public repo that pulls that published image.

Nothing has been submitted or published, and no image has been pushed to any registry.

Glama also still needs an account before anything can be filed. The prepared listing copy is
in `docs/seo/submission-results.md`.

### Still true from the superseded note

Transport is becoming a listing-eligibility feature. Befall ships a local daemon plus a stdio
proxy and is listed on mcpservers.org; BountyVerdict, in the same Related Servers block,
advertises "Remote Streamable HTTP" explicitly.

## Docs discrepancy: Windows is neither claimed nor denied

Every install guide is written in macOS/Linux terms — `curl … | sh`, `~/.tower/bin`,
`/Users/you/.tower/bin/tower-mcp`. No guide states whether Windows is supported, and the
one-line installer as documented will not run on native Windows.

**Resolved for now, pending a real check.** All seven install guides, the FAQ and the README
now state plainly that macOS and Linux are what Tower is used on, that Windows is untested
rather than broken, and that the `curl … | sh` line will not run on native Windows as
written. That matches the 🍎 🐧 markers already on the awesome-mcp-servers entry, so no
change was needed there.

If a Windows check passes, three docs and one directory entry move together — do not update
one without the others.

Separately: that entry carries no programming-language marker, where nearly every
neighbouring entry does. If there is no objection to naming the implementation language
publicly, adding it makes the entry look less like a drive-by.

## Phrasing rule that now has teeth

Glama's spam filter reacts to "hosted at" and "at domain". The awesome-mcp-servers list
[syncs into the Glama directory](https://glama.ai/mcp/servers), so that rule applies to the
list entry too, not just to Glama's own form. The entry has been corrected on the branch.
Keep the phrasing out of any copy that could end up there.

## Competitors worth watching, from our own listing

mcpservers.org shows Related Servers on the Crews page. Two are direct:

- **[Befall](https://github.com/esenbora/befall-mcp)** — nearest competitor found. Same
  pitch, but claims are *refused at claim time* (first-writer-wins, TTL auto-release) rather
  than surfaced as warnings, with git dirty-path heartbeats as a backstop when an agent
  ignores the protocol. MIT, 14 `vs_*` tools, no commits since mid-August.
- **[Keelen](https://mcpservers.org/)** — "autonomous dev team steered from chat", GitHub
  repo in, merged PRs out, on your own model key. Different shape, same buyer.

The advisory-versus-enforced distinction is the sharpest question a prospect will ask after
seeing Befall. Worth an answer that is better than "warnings are safer."

## Needs a human — cannot be done from here

1. **Accounts on Glama and Smithery.** Both are behind a sign-up, and registering accounts is
   out of scope for an automated session.
2. **The Glama Dockerfile decision** — publish an image and point at it, or add a pulling
   Dockerfile to the public repo. Until one of those, Glama has nothing to build.
3. **Whether to pursue OAuth on `/mcp`** or accept that Smithery is an MCPB-bundle listing
   only.
4. **Merging or closing [PR #1](https://github.com/ali8hsn/crews/pull/1)**, which carries the
   Docker and MCPB documentation and is still open.
5. **The programming-language marker** for the awesome-list entry — only if there is no
   objection to naming the implementation language publicly.

Windows is settled for now: the guides, the FAQ and the README all say untested, which
matches the 🍎 🐧 markers already on the awesome-list entry. No change needed there. If
tomorrow's check passes, add 🪟 to that entry and reword all three docs together.
