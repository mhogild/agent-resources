---
name: agent-retro
description: >
  After a task or build, capture what worked and what didn't and apply targeted
  edits to the team's own agent, skill, and command files so the team gets better
  each run. Use at the end of a project, after a painful failure, or when the user
  says the agents should be tuned/optimized. Keeps a changelog of the team's
  evolution.
---

# Agent Retro (self-improvement loop)

The team is not static. Every run is data about where the harness is weak. This
skill turns that data into concrete edits to the team's own definitions — the
loop that makes the setup compound over time.

## When to run

- At the end of a build, especially if a gate caught something late that an
  earlier gate should have caught.
- After any failure, surprise, or "the agent kept doing X" friction.
- When the user explicitly asks to tune/optimize the agents.

## Method

1. **Gather signal.** What did each role produce? Where did work bounce between
   gates? What did a human have to correct that a gate should have caught? What
   did an agent misunderstand or have to guess?
2. **Locate the root cause in a definition, not a person.** A repeated mistake is
   almost always a missing instruction, an unclear contract, or a gate in the
   wrong place — fix the `.claude/agents/*.md`, `.claude/skills/*/SKILL.md`, or
   `.claude/commands/*.md`, not the one-off output.
3. **Make the smallest targeted edit** that would have prevented the problem. Add
   the missing check to a rubric, tighten an agent's scope, move a gate earlier,
   sharpen a trigger in a skill description. Avoid bloating — prefer a sharper
   sentence over a new paragraph.
4. **Record it.** Append a dated line to `docs/team-changelog.md`: what changed,
   in which file, and why (the observation that prompted it).
5. **Note anything structural** that a single edit can't fix (e.g. "we need a new
   role / a new skill") and raise it to the user rather than silently building it.

## Output

```
## Retro — <task> — <date>
### What happened (signal)
### Root cause (which definition is weak)
### Edits applied
- file → change → why
### Raised to user (structural changes, if any)
```

Keep the team lean. The goal is a setup that needs *fewer* corrections over time,
not one that accretes rules forever.
