<!-- Mirrors the codex guide shown at https://trycrews.com/install -->
# Codex

## Install Tower first

One line per machine. It downloads `tower` and `tower-mcp` into `~/.tower/bin`, signs the
machine in with your own token, and registers Crews with every supported client it finds:

    curl -fsSL https://trycrews.com/install.sh | sh -s -- --token <your-token>

Get a command with your token already filled in at https://trycrews.com/install#get-command.
Then run `tower doctor`; a healthy setup reports PASS for Config, Server, and User MCP, and
names the clients Crews registered.

**Platform:** the installer and `tower` are used on macOS and Linux. **Windows is
untested** — not known to be broken, simply not verified, and the `curl … | sh`
one-liner above will not run on native Windows as written. Use WSL, or wait until
this note says otherwise.


The installer registers Tower with Codex automatically whenever it finds it on the
machine. `tower connect` does the same thing on demand.

## What gets written

User-level MCP config: `~/.codex/config.toml` — the one client configured in TOML.

    [mcp_servers.tower]
    command = "/Users/you/.tower/bin/tower-mcp"

The edit is textual on purpose: only Tower's own table is replaced or appended, so your
other tables, key order, and comments survive untouched. No token is stored here —
`tower-mcp` reads credentials from `~/.tower/config.json`.

## The full coordination setup

`crews install codex`, run in a repo, adds the parallel-session layer on top. It appends
a `[mcp_servers.crews]` table to that repo's `.codex/config.toml` and the coordination
rules to `AGENTS.md`:

    [mcp_servers.crews]
    command = "/Users/you/.tower/bin/tower-mcp"
    args = []
    env_vars = ["CREWS_TOKEN", "CREWS_SERVER_URL", "CREWS_REPO", "CREWS_CLIENT",
      "TOWER_TOKEN", "TOWER_SERVER_URL", "TOWER_DIR"]
    cwd = "/Users/you/code/your-repo"

    [mcp_servers.crews.env]

`env_vars` is explicit because Codex filters the environment it passes to an MCP server;
only Crews and Tower runtime settings are forwarded. Add `--user` to write
`~/.codex/config.toml` and `~/.codex/AGENTS.md` instead, without the `cwd` line. The
installer also prints the equivalent `codex mcp add crews` command.

## Verify

    tower doctor
    codex mcp get crews

Look for `User MCP: tower registered in Codex`. A project-scope table only takes effect
once the project is trusted in Codex.

## What degrades

Codex supports resources and nothing else optional — no prompts, sampling, elicitation,
roots or server notifications. What Codex does with an incoming message depends on the
client; coordination notes always land as banners on the result of whatever tool you
just called and stay in `crews.message.inbox`, even when the client cannot surface them
mid-turn.

## Remove

Delete the `[mcp_servers.tower]` and `[mcp_servers.crews]` tables from
`~/.codex/config.toml` and any repo's `.codex/config.toml`, and the block between the
`crews:start` and `crews:end` markers in `AGENTS.md`.
