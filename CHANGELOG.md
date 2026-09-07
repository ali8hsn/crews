# Changelog

All notable changes to the Crews public documentation are recorded here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## 2026-09-07

### Added

- `docs/run/docker.md` and `docs/run/mcpb.md`: running Crews without the installer, as a
  container image or as an MCPB bundle. Both run Tower in remote-client mode against the
  hosted endpoint, take a Crews API key as their only required setting, and use no
  database. The MCPB bundle is how Crews is distributed on Smithery.
- Links to both from `README.md` and `llms.txt`.
- A root `Dockerfile` that re-exports `ghcr.io/bmp0404/crews:latest`, so registries that
  index this repository have something to resolve, and `docs/run/ghcr.md` explaining what
  the image is, how it is published, and why that file is here at all.

### Changed

- `docs/seo/submission-results.md`: the Glama and Smithery sections appeared twice and now
  appear once each. The Smithery entry's claim that the server is stdio-only is corrected —
  production serves Streamable HTTP at `/mcp` and authenticates with a bearer token, so the
  blocker is the auth scheme, not the transport.

### Added earlier

- `docs/how-it-works.md`, `docs/faq.md`, and sourced comparison pages under `docs/compare/`
  for Raft, Wormhole, Cursor Origin, Buzz, Befall and Entire.
- `LOG.md`, recording every external action taken against this repository with its URL.
- `docs/seo/submission-results.md`, tracking directory and awesome-list submissions.

### Changed

- Expanded `README.md` with what Crews does, and what it deliberately does not do.
- Extended `llms.txt` with the new documentation pages.

### Added earlier the same day

- Initial public documentation: README, `llms.txt`, and per-client install guides for Cursor, Codex, Claude Code, VS Code, Kiro, Windsurf and Perplexity, matching what [trycrews.com/install](https://trycrews.com/install) shows today.
