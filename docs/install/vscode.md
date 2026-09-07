<!-- Mirrors the vscode guide shown at https://trycrews.com/install -->
# VS Code / Copilot

## Install Tower first

One line per machine. It downloads `tower` and `tower-mcp` into `~/.tower/bin`, signs the
machine in with your own token, and registers Crews with every supported client it finds:

    curl -fsSL https://trycrews.com/install.sh | sh -s -- --token <your-token>

Get a command with your token already filled in at https://trycrews.com/install#get-command.
Then run `tower doctor`; a healthy setup reports PASS for Config, Server, and User MCP, and
names the clients Crews registered.


`tower connect` does not register VS Code — it only wires up Claude Code, Cursor, Codex
and Claude Desktop. Install Tower first, then point VS Code at it explicitly:

    crews install vscode

## What gets written

Workspace MCP config: `.vscode/mcp.json` in the repo you ran it in. VS Code uses a
`servers` root rather than `mcpServers`.

    {
      "servers": {
        "crews": {
          "type": "stdio",
          "command": "/Users/you/.tower/bin/tower-mcp",
          "args": [],
          "env": {},
          "cwd": "${workspaceFolder}"
        }
      }
    }

The merge is JSONC-aware, so your comments and any servers already listed survive. No
token is stored here — `tower-mcp` reads credentials from `~/.tower/config.json`.

`crews install vscode --user` writes the profile-level file instead, and without the
`cwd` line: `~/Library/Application Support/Code/User/mcp.json` on macOS,
`AppData/Roaming/Code/User/mcp.json` on Windows, `~/.config/Code/User/mcp.json` on
Linux. Pass `--config-path` if you keep VS Code in a non-default profile. The installer
also prints an equivalent `code --add-mcp` one-liner, if you would rather have VS Code
write its own profile entry.

## Coordination instructions

Workspace scope appends the coordination rules to `.github/copilot-instructions.md`,
inside `<!-- crews:start -->` / `<!-- crews:end -->` markers, so the rest of the file is
untouched. User scope has no equivalent file: the installer prints the same rules for
you to paste into Chat: New Instructions File > User profile with `applyTo: '**'`.

## Verify

    VS Code: MCP: List Servers > crews > Start

Then ask Copilot to call `crews.status`. The generated config has been exercised against
the real Tower MCP server, but the VS Code application itself has not been driven
end to end here — expect to confirm the server starts on your own machine.

## What degrades

VS Code's MCP support covers resources and prompts. Sampling, elicitation, roots, server
notifications and resource subscriptions are left off, so Tower never depends on them.
Conflict notices do not travel over any of those channels anyway: they always arrive as
banners on the result of whatever tool you just called, and stay readable in
`crews.message.inbox`.

## Remove

Delete the `crews` entry from `servers` in the config file, and the block between the
`crews:start` and `crews:end` markers in `.github/copilot-instructions.md`.
