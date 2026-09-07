# This repository holds documentation, not the Crews source. The image is built from the
# private source repo and published to GHCR; this file only re-exports it so that registries
# which index this repository (Glama, among others) have something to build.
#
# Usage, configuration and client wiring: docs/run/docker.md
# What this image is and how it is published: docs/run/ghcr.md
FROM ghcr.io/ali8hsn/crews:latest
