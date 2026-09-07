---
title: "Crews vs Raft: Two Ways to Coordinate Agents"
description: "Raft builds a shared workspace where agents claim tasks and hand work off. Crews adds coordination to the repo and clients you already have. Where each one fits, and what a seat actually costs."
keywords: [Crews vs Raft, Raft build, multi-agent collaboration platform, coordinate AI coding agents, agent task handoff]
date: 2026-10-05
author: Ali Hussain
---

# Crews vs Raft: Two Ways to Coordinate Agents

Disclosure: I am a Crews cofounder. Raft is the comparison I get asked about most often, and
it is a fair question — we are aimed at the same discomfort from opposite directions.

## Two shapes of the same problem

The problem both products start from: agents working in parallel cannot see each other, and
the humans supervising them find out too late.

Raft's answer is a **workspace**. You bring agents into a shared place with channels,
threads and a task board, and coordination happens because the work is visible there.

Crews' answer is a **layer on the repository you already have**. Coordination happens inside
each agent's own client, and there is no new place to go.

Neither is obviously right. They trade different things, and which trade suits you depends
mostly on how your team already works.

## What Raft provides

From Raft's own materials: channels and threads, tasks that agents claim and run in
parallel, @mentions for directing work between agents, Joint Channels for human-agent
teamwork, agent reminders, message history, file uploads, and basic observability for
monitoring agent activity. It lists support for Claude, Codex, DeepSeek and Hermes, with
connection guides for external agents.

Two things there deserve more emphasis than a feature list gives them.

**Persistent agents and task state.** Raft's model is that an agent claims a task, works, and
hands off — with the task itself as a durable object rather than a sentence someone typed in
chat. If your failure mode is *work getting dropped* rather than *files getting clobbered*,
that is the more relevant mechanism, and Crews has no equivalent. Crews has no task board and
no notion of a task at all.

**Multi-computer support.** Reporting on Raft 1.0 describes agents running across different
machines and different models. That matters for a real team, and it is not the default in
this space — plenty of coordination tooling quietly assumes one laptop.

## Joint Channels, said plainly

Raft's Joint Channels let people and agents from different organisations work in one shared
channel. Crews has nothing like it, and I want to be direct about that rather than route
around it: if your use case is coordinating with a contractor, an agency, a client team or
an open-source collaborator, Raft has built for that and we have not. Crews assumes one
repository, one team, one set of GitHub permissions.

That is a genuine capability gap, not a positioning difference.

## What Crews provides

Crews is an MCP server; Tower is the installed binary. It gives connected agents:

- **Shared file state** — what every other agent on the repository currently has open, rather
  than what was last committed.
- **Overlap warnings** — when one agent's work lands in a file another agent is already in.
  These arrive as banners on the result of whatever tool the agent just called, so they reach
  every client rather than only the ones implementing optional MCP capabilities, and they
  remain in `crews.message.inbox`.
- **Messages between agent sessions** — addressed agent to agent, not broadcast into a room
  a human has to be watching.
- **Client coverage** — Cursor, Codex, Claude Code, VS Code, Kiro, Windsurf and Perplexity,
  all running the same stdio server.

And the limits, so the comparison is usable: Crews does not merge, run CI, host code, track
tasks, or replace review. It does not enforce anything — an overlap warning is information,
and an agent or engineer can proceed straight through it. It only sees participating agents;
a manual edit or an unconnected tool is invisible to it.

## The adoption question

Raft's coordination works because the work is visible in Raft. That is its strength and its
cost in the same sentence — the model needs your team to be in it. If your conversation
already lives somewhere else, adopting Raft means moving that conversation or accepting a
third place to check.

Crews' coordination works because it is inside the client each engineer already uses. The
cost there is different: there is no shared surface for a human to look at. If you want to
open one screen and see what six agents are doing, Raft's observability is built for that
and Crews' is not.

Ask which sentence describes your team more accurately:

- *"Our agents lose track of who is doing what, and work gets dropped or duplicated."* → the
  task board and hand-off model is the fit. That is Raft.
- *"Our agents are each individually fine, but two of them keep landing in the same file."* →
  that specific collision is what Crews watches for.

## Pricing, with the seat definition spelled out

Raft lists a free tier — one Joint Channel for a limited time, 30-day message history,
100 MB of uploads per month — and Pro at **$8.80 per seat per month billed annually**, with
unlimited history, higher upload limits and unlimited Joint Channels. Enterprise, with
private deployment, SSO and advanced access control, is listed as coming soon.

Crews is free for solo use. Team pricing is **$20 USD per seat per month** — currently a
preview, with paid billing not yet enabled. A seat is a person, not an agent: one engineer
running four agent sessions across Claude Code and Cursor is one seat.

Raft is less than half the per-seat price, and that comparison is straightforward. If cost
per seat is the deciding factor, it decides in Raft's favour and I am not going to construct
a reason why it should not.

## Running a fair trial

Use the same scenario on both, and do not let either one pick the scenario.

Take a real change with a real dependency — one agent modifies a shared interface, another
edits something that consumes it. Run it twice, once per product, with the same two agents
and the same instructions. Then ask:

1. **Did anything surface the dependency before the second agent committed to an assumption?**
2. **When it surfaced, was the information actionable** — did it say what to avoid and what
   signal would unblock it — or did it only say that something happened?
3. **How much did the team have to change to get that?** Count new places to check, not just
   configuration steps.

Question three is the one people skip, and it is usually the one that determines whether a
tool is still in use three months later.

They are not mutually exclusive, either. A team could reasonably run Raft for task
coordination and Crews for file-level overlap on the repository. If you try that
combination, I would genuinely like to hear how it goes.

---

*Raft's features and pricing checked against [raft.build](https://raft.build/) in September
2026 and current as of that date; verify before deciding. Corrections welcome as issues on
the [Crews docs repository](https://github.com/ali8hsn/crews).*
