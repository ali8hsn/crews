<!-- The published container image, and why a one-line Dockerfile sits in this repository -->
# The published image (GHCR)

[docs/run/docker.md](docker.md) covers running Crews in a container: configuration, how the
repository slug is resolved, wiring it into a client, and what the container gives up
compared with the installed Tower. This page covers the image itself — where it comes from,
how it is published, and why there is a one-line `Dockerfile` at the root of a repository
that contains no source code.

## Status

> **The image is not published yet.** `ghcr.io/ali8hsn/crews:latest` does not resolve at the
> time of writing, so the root `Dockerfile` will not build and the `docker pull` below will
> fail. This page describes the intended shape so the documentation and the registry
> submissions are ready when the image goes public. Nothing here should be read as a claim
> that it already works.

## Pull and run

    docker pull ghcr.io/ali8hsn/crews:latest
    docker run --rm -i \
      -e CREWS_API_KEY=<your-token> \
      -e CREWS_REPO=owner/repo \
      ghcr.io/ali8hsn/crews:latest

`-i` is required — the server speaks MCP over stdin and stdout and opens no port. Every
option in [docs/run/docker.md](docker.md#configuration) applies unchanged; the image is the
same one that page describes.

## Tags

| Tag | Meaning |
| --- | --- |
| `latest` | The most recent published release. |
| `vX.Y.Z` | A specific release. Pin this in CI. |

Pin a version anywhere the run has to be reproducible. `latest` is for a first try and for
registries that need a stable reference.

## Platforms

The tag is a multi-architecture manifest covering `linux/amd64` and `linux/arm64`, so Apple
Silicon and ARM CI runners get a native image rather than an emulated one. Docker picks the
matching one; `--platform` overrides it.

    docker run --rm -i --platform linux/amd64 -e CREWS_API_KEY=<your-token> \
      ghcr.io/ali8hsn/crews:latest

## What is inside

Two stages. The first compiles Tower's remote client into a single standalone binary; the
second is Alpine carrying that binary, `git`, and nothing else — no package manager, no
`node_modules`, no toolchain, no source. It runs as a non-root user.

`git` is there for exactly one thing: the read-only `git remote get-url origin` that names
the repository when you mount a checkout. See
[docker.md](docker.md#naming-the-repository).

## Provenance

Each image carries the standard OCI labels pointing back at the commit it was built from:

    docker inspect ghcr.io/ali8hsn/crews:latest \
      --format '{{json .Config.Labels}}' | tr ',' '\n'

`org.opencontainers.image.source` is the source repository, `.revision` the exact commit,
`.version` the release. The source repository is private, so the revision is a reference
point rather than something you can check out.

## Verifying what you pulled

    docker run --rm -i ghcr.io/ali8hsn/crews:latest </dev/null

With no `CREWS_API_KEY` that exits 1 and tells you to set one, which is the quickest proof
the image runs at all. For a real check, send it an MCP `initialize`:

    printf '%s\n' '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"probe","version":"0"}}}' \
      | docker run --rm -i -e CREWS_API_KEY=<your-token> ghcr.io/ali8hsn/crews:latest

A healthy server answers with `"serverInfo":{"name":"crews",…}`.

## Why a Dockerfile lives in a docs repository

This repository is documentation. The Crews source, and the real multi-stage Dockerfile that
builds the image, live in a private repository.

That creates a problem for registries. Several of them — Glama among them — index a public
GitHub repository and build what they find there. Pointed at `ali8hsn/crews`, they find no
Dockerfile and have nothing to build, so the listing cannot complete.

The root `Dockerfile` here is the smallest honest answer to that:

    FROM ghcr.io/ali8hsn/crews:latest

It re-exports the published image rather than pretending to build one. A registry that
builds it gets exactly the image that would have been pulled, and nobody reading this
repository is misled into thinking the source is here.

The trade is worth stating plainly: this file is only as trustworthy as the publishing
pipeline behind the tag. It is not a reproducible build, and it cannot be audited by reading
this repository. If that matters for your use, run the installer instead — see the
[README](../../README.md).

## Where the image is built

From the private source repository, on release. This repository is never the build input;
its `Dockerfile` is a pointer, not a definition. When the image moves — a different registry,
a different name — this page and that one line change together, and nothing else does.

A GitHub Actions workflow does the publishing on every `v*` tag: it builds both
architectures, pushes the version tag and `latest`, and then runs the image it just
published and checks that it answers an MCP `initialize` before the release counts as done.
Nothing is published from a developer's machine.
