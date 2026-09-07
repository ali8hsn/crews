<!-- Mirrors the windsurf guide shown at https://trycrews.com/install -->
# Windsurf / Cascade

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


`tower connect` does not register Windsurf — it only wires up Claude Code, Cursor, Codex
and Claude Desktop. Install Tower first, which also puts `crews` on your PATH, then
point Windsurf at it explicitly. Windsurf reads one global MCP config, so this has to be
user-scoped:

    crews install windsurf --user

Run without `--user` and nothing global is written: the installer prints the config it
would have added and tells you to re-run with `--user`.

## What gets written

Global MCP config: `~/.codeium/windsurf/mcp_config.json`

    {
      "mcpServers": {
        "crews": {
          "command": "/Users/you/.tower/bin/tower-mcp",
          "args": [],
          "env": {}
        }
      }
    }

Only the `crews` entry is added or replaced; anything else in the file stays. The
absolute path matters because GUI apps start MCP servers with a minimal PATH. No token
is stored here — `tower-mcp` reads credentials from `~/.tower/config.json`.

## Rules file

User scope appends the coordination rules to
`~/.codeium/windsurf/memories/global_rules.md`, inside `crews:start` / `crews:end` HTML
comment markers. Project scope writes `.windsurf/rules/crews.md` in the repo instead,
with `trigger: always_on` front matter — useful on its own if you want the rules in one
repo without touching the global config.

## Verify

    Cascade: MCPs > crews > refresh

Then ask Cascade to call `crews.status`. Windsurf is not installed on the machine these
files were checked on: the generated config passes a scripted stdio conformance run
against the real server, but the Windsurf application itself has not been exercised
here.

## What degrades

The Windsurf adapter claims stdio and HTTP transport and nothing optional — no
resources, prompts, sampling, elicitation, roots or server notifications. Coordination
does not depend on any of them: conflict notices always arrive as banners on the result
of whatever tool you just called, and stay readable in `crews.message.inbox`.

## Remove

Delete the `crews` entry from `mcpServers` in `~/.codeium/windsurf/mcp_config.json`, the
block between the `crews:start` and `crews:end` markers in
`~/.codeium/windsurf/memories/global_rules.md`, and `.windsurf/rules/crews.md` in any
repo where you installed at project scope.
