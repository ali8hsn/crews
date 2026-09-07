<!-- MCPB bundle: one-click install into desktop MCP clients -->
# MCPB bundle

[MCPB](https://github.com/modelcontextprotocol/mcpb) — MCP Bundle — is a zip of a manifest
and the server it describes, which a desktop MCP client installs in one click the way a
browser installs an extension. Crews ships one as `crews.mcpb`. It is also how Crews is
distributed on [Smithery](https://smithery.ai), which lists local servers as bundles.

The bundle runs **Tower in remote-client mode**: the same MCP tool surface as `tower-mcp`,
configured from the values you type into the install dialog and pointed at the hosted Crews
endpoint. It stores nothing locally, opens no database connection, and needs no Postgres.

## Installing

Download `crews.mcpb` and open it with a client that supports MCPB, or install it from the
Crews page on Smithery. The client will ask for:

| Field | Required | Notes |
| --- | --- | --- |
| **Crews API key** | yes | Your token, from **Setup** at [trycrews.com](https://trycrews.com). Stored in the OS keychain, not in a config file. |
| **Repository** | no | GitHub slug, for example `acme/web`. Leave blank to read it from the `origin` remote of the directory the client launches the server in. |
| **Crews server URL** | no | Only for a self-hosted Crews instance. Defaults to `https://trycrews.com`. |

The API key is the only field you have to fill in.

The bundle carries a Node-targeted build of the server rather than a compiled binary — one
cross-platform artifact of about 105 KB instead of one per platform at about 60 MB each.
MCPB hosts provide the Node runtime, so there is nothing to install alongside it. It
declares macOS, Windows and Linux, and Node 18 or newer.

## Naming the repository

Crews coordinates agents per repository. If you leave **Repository** blank, the server
reads the slug from the working directory it is launched in — which works when your client
launches MCP servers from the project you have open, and does not when it launches them
from a fixed directory. If tools come back asking for `CREWS_REPO`, fill the field in.

The server starts either way, and advertises its full tool list either way; only the calls
that need a repository fail, and they say so.

## Building it yourself

From a Crews source checkout:

    bun run build:mcpb

writes `dist/crews.mcpb`. Publish with the Smithery CLI:

    smithery mcp publish ./dist/crews.mcpb -n <org>/<server>

One quirk worth knowing if you edit the manifest: it deliberately declares no `tools`
array. MCPB tool entries carry only a name and a description, but the Smithery registry
validates them as full MCP `Tool` objects and rejects the upload with HTTP 400 once for
every tool declared ([smithery-ai/cli#787](https://github.com/smithery-ai/cli/issues/787)).
Clients read the live tool list over stdio anyway, so nothing is lost by leaving it out.

## What you give up

Same as the [container image](docker.md): the bundle is the MCP server only. Capture hooks,
the status line, `tower doctor` and the per-client setup that [`crews install`](../install/)
writes are not part of it. Agents can register, claim files, see conflicts and message each
other; they will not automatically report the session events that an installed Tower
reports.

If you can install Tower, install Tower. The bundle is for clients where a one-click
install is the only path.
