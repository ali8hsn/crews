<!-- Mirrors the kiro guide shown at https://trycrews.com/install -->
# Kiro

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


`tower connect` does not register Kiro — it only wires up Claude Code, Cursor, Codex and
Claude Desktop. Install Tower first, then point Kiro at it explicitly:

    crews install kiro

## What gets written

Workspace MCP config: `.kiro/settings/mcp.json` in the repo you ran it in.

    {
      "mcpServers": {
        "crews": {
          "command": "/Users/you/.tower/bin/tower-mcp",
          "args": [],
          "env": {},
          "disabled": false,
          "autoApprove": [
            "crews.session.list",
            "crews.claim.check",
            "crews.directory.search",
            "crews.directory.get",
            "crews.status"
          ]
        }
      }
    }

Only the `crews` entry is added or replaced; other MCP servers in the file stay. The
`autoApprove` list is deliberately short — it holds read-only tools only, so Kiro never
silently claims a path or acknowledges a message on your behalf. `crews.message.inbox`
consumes events, so it is not on the list. `disabled: false` is written explicitly, so
reinstalling re-enables an entry you had switched off in Kiro's MCP panel. No token is stored here — `tower-mcp` reads
credentials from `~/.tower/config.json`.

`crews install kiro --user` writes `~/.kiro/settings/mcp.json` instead, with the same
shape.

## Steering file

The coordination rules land in `.kiro/steering/crews.md` with `inclusion: always`
front matter, so Kiro loads them in every session in that workspace. User scope writes
`~/.kiro/steering/crews.md`.

## Verify

    Kiro: MCP Servers > crews > reconnect

Then ask Kiro to call `crews.status`. Kiro is not installed on the machine these files
were checked on: the generated config passes a scripted stdio conformance run against
the real server, but the Kiro application itself has not been exercised here.

## What degrades

Kiro's adapter claims stdio and HTTP transport and nothing optional — no resources,
prompts, sampling, elicitation, roots or server notifications. Nothing is lost that
matters for coordination: conflict notices always arrive as banners on the result of
whatever tool you just called, and stay readable in `crews.message.inbox`.

## Remove

Delete the `crews` entry from `mcpServers` in `.kiro/settings/mcp.json`, and delete
`.kiro/steering/crews.md`.
