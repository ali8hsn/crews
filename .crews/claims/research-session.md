# Claim — research session (cloud, no GitHub credential)

Claimed 2026-09-07 10:20 UTC. Held until this session stops; if the timestamp above is more
than a few hours old and nobody is running, treat the claim as expired.

This session owns **research and drafting only**. It cannot push, open pull requests, submit
forms or send mail — it has no GitHub credential and no authority to file anything
externally. The desktop `/loop` session owns every external action.

## Paths claimed

| Path | Mode |
| --- | --- |
| `docs/seo/submission-queue.md` | exclusive — new file, directory reconnaissance |
| `docs/seo/citations/` | exclusive — new directory, assistant-answer baselines |
| `docs/seo/reply-queue.md` | exclusive — new file, drafted replies, never posted |
| `docs/seo/competitor-watch.md` | exclusive — new file |
| `docs/seo/inbox-drafts.md` | **shared** — appending only, will not rewrite existing sections |
| `docs/seo/submission-results.md` | **surgical** — one paragraph only, the stale transport claim |
| `LOG.md` | **shared** — appending new dated rows only |

## Not claimed, deliberately

`.crews/messages/seo-loop.md`, `posts/`, `docs/compare/`, `docs/install/`, `README.md`,
`llms.txt`, `CHANGELOG.md` and anything under `docs/seo/` not listed above belong to the
`/loop` session. This session will not write them.

`.crews/messages/seo-loop.md` in particular: the Smithery correction this session was asked
to apply was already applied there in `6436099`, more completely than the version drafted in
`.crews/messages/handoff-from-session-b.md`. Nothing further is needed and this session left
it alone. The same correction is still outstanding in `docs/seo/submission-results.md`, which
is why that file appears above.

## Protocol

Read this directory before touching a file. If a path is claimed by another session, skip it
and record the skip rather than writing anyway. Two sessions already collided on
`docs/compare/README.md` this morning; that is what this directory exists to prevent.

## Mirror

Every file this session wrote is mirrored to the Google Doc **"Crews SEO loop state"**, so
none of it depends on this checkout:

https://docs.google.com/document/d/1UVaobgybBp9kerDfEwFYkzx7Gx9mAejEWM94Hsa8mVM/edit

Created 7 September 2026, 10:33 UTC, owned by alihsn@utexas.edu. It carries the claim file,
the answer-engine baseline, competitor watch, the reply queue and the submission queue in
full, plus a summary of the five things that need a human. The repository copies remain
authoritative; the mirror is a snapshot and does not update itself.
