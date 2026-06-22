---
name: architecture-design
description: >
  Turn a GO discovery brief and a chosen solution into a concrete design/ADR that
  coders can build from in parallel without colliding. Use after the solution
  space is explored and before any implementation. Defines components, the
  contracts between parallel work units, the data model, and the dev/prod plan.
---

# Architecture & Design

Produce the foundation the build stands on. The single most important output is
**clean contracts between work units** — that is what lets two coders run in
parallel (and overnight) without stepping on each other.

## What the design must specify

1. **Components & responsibilities.** Each major piece, what it owns, what it does
   not own. Keep it boring and maintainable — one person carries the support tail.
2. **Contracts / interfaces.** For every boundary where work units meet, define
   the exact interface: types/shapes, function signatures, API routes, events,
   DB schema. These are frozen for the duration of the build; changing one is an
   escalation, not a silent edit. This section is what `work-breakdown` slices on.
3. **Data model & state.** Entities, relationships, source of truth, migrations.
4. **Dev/prod plan.** Load `dev-prod-isolation`. State which environment work
   happens in, how preview deploys are produced, and where the human promotion
   gate sits. Agents build in dev/preview only.
5. **Risks & spikes.** The unknowns, and the smallest experiment to retire each
   before committing the team.

## Default stack (unless the brief says otherwise)

Next.js (App Router) + TypeScript, Vercel/Netlify with preview-per-branch, a
managed Postgres (e.g. Neon/Supabase) with separate dev and prod databases.
Choose the boring, well-supported option; novelty is a cost, not a feature.

## Output: Design Doc / ADR

```
# Design — <project>
## Context (link Discovery Brief + chosen option)
## Components & responsibilities
## Contracts (the frozen interfaces between units)   <-- the critical section
## Data model & migrations
## Dev/prod & promotion plan
## Risks, unknowns, spikes
## Out of scope
```

A design that doesn't pin the contracts isn't done — the coders will collide.
Hand the finished doc to `work-breakdown`.
