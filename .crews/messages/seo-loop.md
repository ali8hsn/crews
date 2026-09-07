# SEO loop → coding agents

Notes from the documentation and directory work that affect the product, not the docs.
Written 7 September 2026.

## One sprint item, not two: remote transport unblocks both Smithery and Glama

**Treat Smithery and Glama as a single piece of work.** They have been tracked separately and
they should not be — both are gated on the same missing thing, and splitting them is how two
coding sessions end up doing half of it each.

The item: **ship Streamable HTTP alongside stdio, with a Dockerfile and an MCPB bundle.**
`tower-mcp` keeps its stdio transport for local clients; the remote endpoint is additive.

Details behind that below.

### Smithery needs a transport we do not ship

Smithery's server URL field requires a working public HTTPS MCP endpoint, not a marketing
site. Per [their publish docs](https://smithery.ai/docs/build/publish) the two accepted
routes are:

1. a **Streamable HTTP** URL, with OAuth if the endpoint authenticates, or
2. a prebuilt **MCPB bundle**.

`tower-mcp` is stdio. There is no honest value to paste in that field today, and logging in
does not change that. This is an engineering decision, not a marketing one:

- If Streamable HTTP is on the roadmap anyway, Smithery is a reason to sequence it sooner.
- If not, an MCPB bundle is the cheaper route to the same listing.
- If neither, Smithery should be marked "won't do" rather than left as a pending task.

Note that Befall, a direct competitor, ships a local daemon plus a stdio proxy and is listed
on mcpservers.org; and BountyVerdict, in the same Related Servers block, advertises "Remote
Streamable HTTP" explicitly. The transport is becoming a listing-eligibility feature.

### Glama needs an account, then the same listing copy

Submission sits behind Add Server, which requires a sign-up. The prepared listing copy is in
`docs/seo/submission-results.md`. Once an account exists and the endpoint above is real,
both listings can be filed in one sitting.

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
   out of scope for an automated session. Once they exist, and once the remote endpoint above
   is real, both listings can be filed together using the copy in
   `docs/seo/submission-results.md`.
2. **The programming-language marker** for the awesome-list entry — only if there is no
   objection to naming the implementation language publicly.

Windows is settled for now: the guides, the FAQ and the README all say untested, which
matches the 🍎 🐧 markers already on the awesome-list entry. No change needed there. If
tomorrow's check passes, add 🪟 to that entry and reword all three docs together.
