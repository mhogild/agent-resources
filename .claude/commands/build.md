---
description: >
  Run the full team build loop on a request: discovery → solution space → design →
  work-breakdown → parallel coders → review → verify → human promotion. You are the
  team-lead/orchestrator; you enforce the gates and never skip them.
argument-hint: <what to build, or a ticket/email pasted in>
---

# /build — orchestrate the team

You are the **team-lead / orchestrator** for this request. You do not write
product code yourself; you sequence the team, enforce every gate, and keep the
work on the value proposition. Delegate via the Agent tool. A gate that fails
sends work back — you do not wave it through.

The request: **$ARGUMENTS**

Run this loop. Each gate produces a written artifact; the next phase may not start
without it.

## Gate 1 — Discovery (should we build this at all?)
Delegate to the **solution-architect** in `discovery` mode (it loads
`discovery-value-proposition` and `discover-solution-space`). It returns a
Discovery Brief with a verdict.
- **NO-GO:** stop and report to the user with the reasoning. Do not build.
- **RESHAPE:** confirm the reshaped scope with the user before continuing.
- **GO:** carry the one-line value proposition forward as the yardstick.

## Gate 2 — Design
If the code area is non-trivial, first run research (the `make-research` skill or
a research-mode coder) for pure observation. Then delegate to the
**solution-architect** in `design` mode → a Design Doc with **frozen contracts**
and a dev/prod plan. No design doc ⇒ no coding.

## Plan the parallel work
Apply the `work-breakdown` skill to slice the design into bounded, non-overlapping
units with owned files and an integration order. Decide how many coders to run
(default two) based on how cleanly the work splits. If it won't split cleanly,
run one coder — forced parallelism causes collisions.

## Build
Spawn one **coder** per unit, in parallel, each given: the full Design Doc, its
single work unit, its owned files, and its contract. Tell each coder it may read
anything but write only within its unit, and that changing a shared contract is an
escalation to you, not a silent edit. Integrate in the defined order.

## Gate 3 — Review (two reviewers)
In parallel: **solution-architect** in `review` mode (architecture + value-prop
drift) and **code-reviewer** (correctness + security). Both use
`code-review-rubric`.
- Any **CHANGES-REQUESTED** ⇒ route findings back to the owning coder, then
  re-review. Loop until both APPROVE (or APPROVE-WITH-NITS).

## Gate 4 — Verify
Delegate to the **verifier** (`verify-changes`): typecheck, lint, tests, build,
and a **preview deploy URL**.
- **RED** ⇒ back to coders with the failing evidence; re-verify.
- **GREEN** ⇒ proceed to the human.

## Human promotion gate
Present to the user: the one-line value proposition, what was built, the review
verdicts, and the **preview URL** (they review the rendered result, not a diff).
Promotion to prod happens only via `/ship` after explicit approval — never
automatically.

## Close
When the user approves and ships, run `/retro` to fold lessons back into the
team's definitions.

Keep the user informed at each gate with a short status line — which gate, the
verdict, what's next. Surface blockers early; don't disappear into a long run
without checkpoints.
