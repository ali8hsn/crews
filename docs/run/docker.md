<!-- Container image for Tower in remote-client mode -->
# Docker

The usual way to run Crews is the installer, which puts `tower` and `tower-mcp` on your
machine and registers them with your coding client. The container image is for the cases
where that is the wrong shape: CI, a devcontainer, a locked-down workstation where you
would rather not install a binary, or an MCP client that is happier launching `docker` than
a path.

It runs **Tower in remote-client mode** — the same MCP tool surface as `tower-mcp`, but
configured from environment variables alone and pointed at the hosted Crews endpoint. It
stores nothing on disk, opens no database connection, and needs no Postgres. Every
coordination call is an HTTPS request to `https://trycrews.com`.

## Run it

The image is published to the GitHub Container Registry and pulls anonymously — no
`docker login` and no GitHub account:

    docker run --rm -i \
      -e CREWS_API_KEY=<your-token> \
      -e CREWS_REPO=owner/repo \
      ghcr.io/bmp0404/crews:latest

`latest` tracks the most recent release; every release also gets an immutable version tag,
and both `linux/amd64` and `linux/arm64` are covered. See [ghcr.md](ghcr.md) for tags,
provenance and how to verify what you pulled.

`-i` is required. The server speaks MCP on stdin and stdout, so it exposes no port and
starts no HTTP listener; without `-i` there is nothing for it to talk to.

Get a token at [trycrews.com](https://trycrews.com) under **Setup** — the same token the
installer uses.

## Configuration

`CREWS_API_KEY` is the only variable you must set.

| Variable | Required | Default |
| --- | --- | --- |
| `CREWS_API_KEY` | yes | — |
| `CREWS_REPO` | no | read from the `origin` remote of the working directory |
| `CREWS_SERVER_URL` | no | `https://trycrews.com` |

`CREWS_TOKEN` and `TOWER_TOKEN` are still accepted for the token, so a shell that already
has them set from `tower login` works unchanged. `CREWS_SERVER_URL` is only for a
self-hosted Crews instance.

## Naming the repository

Crews coordinates agents *per repository*, so it has to know which one this session is
working on. Either set `CREWS_REPO` to the GitHub slug, or mount a checkout and let the
server read the slug from its `origin` remote:

    docker run --rm -i -e CREWS_API_KEY=<your-token> \
      -v "$PWD:/workspace:ro" crews/tower

Two things to know about the mount:

- A **git worktree** cannot be detected this way. Its `.git` is a file pointing at a path
  on the host that does not exist inside the container. Set `CREWS_REPO` for worktrees.
- The image relaxes git's `safe.directory` check, because a bind mount arrives owned by the
  host's user id and git otherwise refuses to read it. The only git command the image ever
  runs is that read-only `git remote get-url origin`.

If neither is set the server still starts and still advertises its tools — the first tool
call returns an error naming `CREWS_REPO` rather than failing silently.

## Wiring it into a client

Any MCP client that can launch a command can launch the container. For a client that reads
`mcp.json`:

    {
      "mcpServers": {
        "crews": {
          "command": "docker",
          "args": [
            "run", "--rm", "-i",
            "-e", "CREWS_API_KEY",
            "-e", "CREWS_REPO",
            "ghcr.io/bmp0404/crews:latest"
          ],
          "env": {
            "CREWS_API_KEY": "<your-token>",
            "CREWS_REPO": "owner/repo"
          }
        }
      }
    }

The bare `-e CREWS_API_KEY` form passes the variable through from the client's environment
rather than baking the token into the argument list, where it would show up in `ps`.

## What you give up

The container is the MCP server only. The parts of Crews that watch your local session —
capture hooks, the status line, `tower doctor`, the per-client setup that
[`crews install`](../install/) writes — are not in it, because they work by writing files
into your repo and your client's config on the host. Agents in the container can register,
claim files, see conflicts and message each other; they will not automatically report the
session events that the installed Tower reports.

For day-to-day work on a laptop, install Tower. Reach for the container when installing is
not an option.
