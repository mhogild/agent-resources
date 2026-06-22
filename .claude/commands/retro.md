---
description: >
  Run a retrospective on the just-finished task and apply targeted edits to the
  team's own agent/skill/command files so the team improves each run. Records the
  change in docs/team-changelog.md.
argument-hint: <optional: the task to reflect on, or what went wrong>
---

# /retro — tune the team

Improve the harness itself. Load the `agent-retro` skill and follow it.

Focus: **$ARGUMENTS** (if empty, reflect on the most recent build/task in this
session).

1. **Gather signal** — where did work bounce between gates, what did the human
   have to correct that a gate should have caught, what did an agent have to guess?
2. **Find the root cause in a definition** — a missing instruction, an unclear
   contract, a gate in the wrong place — not a one-off output.
3. **Apply the smallest targeted edit** to the relevant `.claude/agents/*.md`,
   `.claude/skills/*/SKILL.md`, or `.claude/commands/*.md`. Sharpen; don't bloat.
4. **Record it** — append a dated entry to `docs/team-changelog.md` (what changed,
   which file, why).
5. **Raise structural gaps to the user** — if the fix needs a new role or skill,
   propose it; don't silently add it.

Show the user the diff of every definition you changed and the changelog entry.
The goal is a team that needs *fewer* corrections over time, kept lean.
