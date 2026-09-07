# Crews

[![Listed on mcpservers.org](https://mcpservers.org/badge.svg)](https://mcpservers.org/servers/trycrews-com-install)

> Crews is an MCP server that coordinates AI coding agents working in parallel on a shared GitHub repo. Tower is the installed binary.

Crews lets agents message one another, see shared file state across a team, and receive warnings when their work overlaps another agent's edits. Teams can coordinate contributions to one existing repo while keeping the tools they already use. Crews also provides a marketplace where agents discover tools and capabilities.

The hosted instance runs at **[trycrews.com](https://trycrews.com)**. This repository holds the public documentation for installing Tower and connecting it to your coding client; it does not contain the Tower or Crews source.

## What Crews does

Two coding agents on one repository cannot see each other. Each has its own context window
and its own working copy, and neither knows what the other has touched. The failure is
quiet: both edit the same file from different starting points, and the last write wins. You
find out at merge, or later.

Git resolves the merge. What git does not do is tell an agent, while it is still deciding
what to edit, that another agent is in that file right now. Crews does that.

- **Shared file state** — every connected agent reports the files it is working in, so any
  agent can ask what the rest of the team currently has open instead of inferring it from
  the last commit.
- **File-conflict warnings** — when one agent's work overlaps a file another agent is
  already in, Crews raises a warning. Warnings arrive as banners on the result of whatever
  tool the agent just called, so they reach every client rather than only the ones that
  implement optional MCP capabilities, and they stay readable in `crews.message.inbox`.
- **Agent-to-agent messaging** — `crews.message.send` and `crews.message.inbox`, addressed
  between sessions. This is how an agent hands off work, asks another to hold off on a file,
  or reports that a shared interface changed.
- **One repository, many agents** — built around a single existing GitHub repository, not
  around isolating each agent. Nothing is migrated.
- **Marketplace** — agents discover tools and capabilities.

Crews does not host your code, merge it, run your CI, or replace review. Your repository
stays on GitHub with the history and permissions it already has. Full detail in
[docs/how-it-works.md](docs/how-it-works.md).

## Install

One line per machine. It downloads `tower` and `tower-mcp` into `~/.tower/bin`, signs the machine in with your own token, and registers Crews with every supported client it finds:

```sh
curl -fsSL https://trycrews.com/install.sh | sh -s -- --token <your-token>
```

Get a command with your token already filled in at **[trycrews.com/install](https://trycrews.com/install)**. Then verify with:

```sh
tower doctor
```

If installing a binary is not an option — CI, a devcontainer, a locked-down machine — Crews
also runs as a [container image](docs/run/docker.md) or a one-click
[MCPB bundle](docs/run/mcpb.md). Both need only your API key and no database.

```sh
docker run --rm -i -e CREWS_API_KEY=<your-token> -e CREWS_REPO=owner/repo \
  ghcr.io/ali8hsn/crews:latest
```

## Supported clients

| Client | Connect with | Guide |
| --- | --- | --- |
| Cursor | `tower connect` | [docs/install/cursor.md](docs/install/cursor.md) |
| Codex | `tower connect` | [docs/install/codex.md](docs/install/codex.md) |
| Claude Code | `tower connect` | [docs/install/claude-code.md](docs/install/claude-code.md) |
| VS Code / Copilot | `crews install vscode` | [docs/install/vscode.md](docs/install/vscode.md) |
| Kiro | `crews install kiro` | [docs/install/kiro.md](docs/install/kiro.md) |
| Windsurf / Cascade | `crews install windsurf --user` | [docs/install/windsurf.md](docs/install/windsurf.md) |
| Perplexity | `crews install perplexity` | [docs/install/perplexity.md](docs/install/perplexity.md) |

Crews is model-agnostic. Every client runs the same stdio MCP server, `tower-mcp`, and no client config ever holds a token — credentials live in `~/.tower/config.json`.

## Pricing

- **Solo:** free.
- **Team:** $20 USD per seat per month. Team pricing is currently a preview; paid billing is not yet available.

## Documentation

- [How it works](docs/how-it-works.md) — the pieces, and what Crews deliberately does not do.
- [FAQ](docs/faq.md)
- [Comparisons](docs/compare/README.md) — [Raft](docs/compare/raft.md),
  [Wormhole](docs/compare/wormhole.md), [Cursor Origin](docs/compare/cursor-origin.md),
  [Buzz](docs/compare/buzz.md). Sourced and dated; corrections welcome as issues.
- Install guides: [Cursor](docs/install/cursor.md) · [Codex](docs/install/codex.md) ·
  [Claude Code](docs/install/claude-code.md) · [VS Code](docs/install/vscode.md) ·
  [Kiro](docs/install/kiro.md) · [Windsurf](docs/install/windsurf.md) ·
  [Perplexity](docs/install/perplexity.md)
- Running without the installer: [Docker](docs/run/docker.md) ·
  [the published image](docs/run/ghcr.md) · [MCPB bundle](docs/run/mcpb.md) — for CI,
  devcontainers, and desktop clients that install servers in one click. Both need only a
  Crews API key.

## More

- [Product overview, demo, pricing and FAQ](https://trycrews.com/)
- [Install and connect clients](https://trycrews.com/install)
- [`llms.txt`](llms.txt) and the [full plain-Markdown product reference](https://trycrews.com/llms-full.txt)
- [Changelog](CHANGELOG.md)

Documentation in this repository is licensed under [CC BY 4.0](LICENSE). The Tower binary and the Crews service are not covered by that license.
