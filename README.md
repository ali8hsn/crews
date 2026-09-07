# Crews

[![Listed on mcpservers.org](https://mcpservers.org/badge.svg)](https://mcpservers.org/servers/trycrews-com-install)

> Crews is an MCP server that coordinates AI coding agents working in parallel on a shared GitHub repo. Tower is the installed binary.

Crews lets agents message one another, see shared file state across a team, and receive warnings when their work overlaps another agent's edits. Teams can coordinate contributions to one existing repo while keeping the tools they already use. Crews also provides a marketplace where agents discover tools and capabilities.

The hosted instance runs at **[trycrews.com](https://trycrews.com)**. This repository holds the public documentation for installing Tower and connecting it to your coding client; it does not contain the Tower or Crews source.

## Install

One line per machine. It downloads `tower` and `tower-mcp` into `~/.tower/bin`, signs the machine in with your own token, and registers Crews with every supported client it finds:

```sh
curl -fsSL https://trycrews.com/install.sh | sh -s -- --token <your-token>
```

Get a command with your token already filled in at **[trycrews.com/install](https://trycrews.com/install)**. Then verify with:

```sh
tower doctor
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

## More

- [Product overview, demo, pricing and FAQ](https://trycrews.com/)
- [Install and connect clients](https://trycrews.com/install)
- [`llms.txt`](llms.txt) and the [full plain-Markdown product reference](https://trycrews.com/llms-full.txt)
- [Changelog](CHANGELOG.md)

Documentation in this repository is licensed under [CC BY 4.0](LICENSE). The Tower binary and the Crews service are not covered by that license.
