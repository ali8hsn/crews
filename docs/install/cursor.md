<!-- Mirrors the cursor guide shown at https://trycrews.com/install -->
# Cursor

## Install Tower first

One line per machine. It downloads `tower` and `tower-mcp` into `~/.tower/bin`, signs the
machine in with your own token, and registers Crews with every supported client it finds:

    curl -fsSL https://trycrews.com/install.sh | sh -s -- --token <your-token>

Get a command with your token already filled in at https://trycrews.com/install#get-command.
Then run `tower doctor`; a healthy setup reports PASS for Config, Server, and User MCP, and
names the clients Crews registered.


The installer registers Tower with Cursor automatically whenever it finds it on the
machine. `tower connect` does the same thing on demand.

## What gets written

User-level MCP config: `~/.cursor/mcp.json`

    {
      "mcpServers": {
        "tower": { "command": "/Users/you/.tower/bin/tower-mcp" }
      }
    }

Only the `tower` entry is added or replaced; anything else already in the file stays.
The config carries an absolute path because GUI apps start MCP servers with a minimal
PATH. No token is stored here — `tower-mcp` reads credentials from
`~/.tower/config.json`.

Run inside a git repo, `tower connect` also installs that repo's Cursor hooks so agent
sessions in it report activity.

## The full coordination setup

`crews install cursor`, run in a repo, adds the parallel-session layer on top. It writes
a second server entry named `crews` into that repo's `.cursor/mcp.json`, plus
`.cursor/rules/crews.mdc` with `alwaysApply: true` so Cursor loads the coordination
rules in every session there.

It also prints a `cursor://anysphere.cursor-deeplink/mcp/install?...` link — the
one-click route, if you would rather let Cursor add the server itself.

Add `--user` to write `~/.cursor/mcp.json` instead. User Rules are a settings screen
rather than a file, so at that scope the installer prints the rules for you to paste
into Cursor > Customize > Rules > User Rules.

## Verify

    tower doctor

Look for `User MCP: tower registered in Cursor`. Restart Cursor if it was open while the
config was written, then check under Customize > MCP that `crews` is listed and ask it
to call `crews.status`. Cursor 3.x gates project-scope MCP servers behind an in-app
approval, so expect a prompt the first time.

## What degrades

Cursor supports resources, prompts, elicitation and roots; sampling, resource
subscriptions and server notifications stay off. Conflict notices do not depend on any
of them — they arrive as banners on the result of whatever tool you just called, and
stay readable in `crews.message.inbox`.

## Remove

Delete the `tower` and `crews` entries from `mcpServers` in `~/.cursor/mcp.json` and any
repo's `.cursor/mcp.json`, and delete `.cursor/rules/crews.mdc`.
