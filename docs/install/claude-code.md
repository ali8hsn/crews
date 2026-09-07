<!-- Mirrors the claude-code guide shown at https://trycrews.com/install -->
# Claude Code

## Install Tower first

One line per machine. It downloads `tower` and `tower-mcp` into `~/.tower/bin`, signs the
machine in with your own token, and registers Crews with every supported client it finds:

    curl -fsSL https://trycrews.com/install.sh | sh -s -- --token <your-token>

Get a command with your token already filled in at https://trycrews.com/install#get-command.
Then run `tower doctor`; a healthy setup reports PASS for Config, Server, and User MCP, and
names the clients Crews registered.


The installer registers Tower with Claude Code automatically whenever it finds it on the
machine. `tower connect` does the same thing on demand.

## What gets written

User-level MCP config: `~/.claude.json`

    {
      "mcpServers": {
        "tower": { "command": "/Users/you/.tower/bin/tower-mcp" }
      }
    }

Only the `tower` entry is added or replaced. Other MCP servers and the rest of the file
are left exactly as they were. No token is stored here — `tower-mcp` reads credentials
from `~/.tower/config.json`.

Run inside a git repo, `tower connect` also sets up that repo's session capture:

- `.mcp.json` — the `tower` server for this project
- `.claude/settings.json` — hooks that emit session events as you work

## The full coordination setup

`crews install claude-code`, run in a repo, adds the parallel-session layer on top. It
writes a second server entry named `crews` into `.mcp.json`, then:

- `.claude/settings.json` — session hooks and a Crews status line
- `CLAUDE.md` — the coordination rules, inside `crews:start` / `crews:end` markers
- `.claude/commands/crews-status.md` and `-claim`, `-msg`, `-handoff` — slash commands
- `.claude/skills/crews-context/` and `parallel-session-protocol/` — the protocol itself

Add `--user` to write `~/.claude.json`, `~/.claude/CLAUDE.md`, and the same commands and
skills under `~/.claude/`. The installer also prints the equivalent `claude mcp add`
command if you would rather run that yourself.

## Verify

    tower doctor
    claude mcp get crews

Look for `User MCP: tower registered in Claude Code`. In a session, the coordination
tools appear as `crews.session.list`, `crews.message.send`, and `crews.message.inbox`.

## What degrades

Nothing important. Claude Code supports resources, prompts, elicitation, roots and
list-change notifications; sampling and resource subscriptions stay off because its docs
do not guarantee them. Conflict notices never ride an optional capability — they arrive
as banners on the result of whatever tool you just called, and stay readable in
`crews.message.inbox`.

## Remove

Delete the `tower` and `crews` entries from `mcpServers` in `~/.claude.json` and any
`.mcp.json`, the hooks and status line from `.claude/settings.json`, the marked block
from `CLAUDE.md`, and the `.claude/commands/crews-*.md` and
`.claude/skills/crews-context/` files.
