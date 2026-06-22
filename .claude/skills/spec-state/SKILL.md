---
name: spec-state
description: >
  The on-disk state convention that lets long and overnight runs survive context
  resets. Use whenever a build spans more than one session or context window, or
  when you need durable memory of what's being built and why. Defines the
  .planning/ directory the orchestrator reads and writes. Inspired by get-shit-done.
---

# Spec-Driven State (.planning/)

Context windows fill up and reset; disk does not. To run autonomously for a long
time without "context rot," the team keeps its memory in files, not in the chat.
The orchestrator reads these at the start of every session and writes them as it
goes, so any fresh context can pick up exactly where the last one stopped.

## The layout

```
.planning/
  PROJECT.md          # what we're building + the one-line value proposition (from discovery)
  ROADMAP.md          # the phases, in order, each marked: todo / in-progress / done
  phases/
    01-<slug>/
      PLAN.md         # this phase's work units (from work-breakdown), each a checkbox
      SUMMARY.md      # written when the phase completes: what shipped, key decisions, follow-ups
```

## Rules

- **Write PROJECT.md from the GO Discovery Brief** — including the one-line value
  proposition every later review measures drift against.
- **ROADMAP.md is the source of truth for "where are we."** Update a phase's
  status the moment it changes. The `progress` skill reads this.
- **PLAN.md holds checkable tasks**, one per work unit, with its owned files and
  contract. Check a box only when that unit is built, tested, and committed.
- **Write SUMMARY.md at phase end**, then start the next phase with a fresh
  context. The summary — not the old context — is what the next phase reads.
- **Atomic commits** reference the task they complete, so git history and PLAN.md
  agree.

## Why
This is the difference between "an agent that did a lot in one long, degrading
context" and "a team that made steady, resumable progress you can audit." Keep the
files terse and current; they are memory, not documentation.
