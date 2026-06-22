# agent-resources

A reusable **team of coding agents** for Claude Code, plus the skills they run on —
managed as dependencies with [`agr`](https://github.com/computerlovetech/agr).

Built for an agency workflow: you take in digital jobs for small businesses
(websites, booking systems, webshops, edits), the agents do the production behind
real safety gates, and **you review the final product** as a live preview before
anything reaches a client's live system. Designed to run a long way on its own —
even overnight — without producing confidently-broken work.

It blends two influences: gated, role-based delegation (PlatformPlatform-style) and
spec-driven, context-disciplined execution from
[get-shit-done](https://github.com/gsd-build/get-shit-done) — durable `.planning/`
state, fresh-context subagents, atomic commits, and a quick path.

→ **Full playbook: [`docs/AGENT-TEAM.md`](docs/AGENT-TEAM.md)** ·
**Operating posture: [`CLAUDE.md`](CLAUDE.md)**

## The team

| Role | What it is | How it shows up |
|---|---|---|
| Team-lead / orchestrator | runs the whole loop, enforces the gates, keeps `.planning/` state | `build` skill (main session) |
| Solution architect | discovery / design / architecture-review (critical-by-default gate) | `solution-architect` agent · `discovery` skill |
| Coder ×2 | build bounded units in parallel, fresh context, dev only, with tests | `coder` agent |
| Code reviewer | correctness + security | `code-reviewer` agent |
| Verifier (QA) | tests/build pass + a live preview URL | `verifier` agent |
| Self-improvement | tunes the team after each run | `retro` skill |

The loop, with four gates that send work back when they fail:

```
discovery ─▶ design ─▶ work-breakdown ─▶ build (×2 coders) ─▶ review ─▶ verify ─▶ you approve preview ─▶ ship
  GATE 1      GATE 2                                          GATE 3     GATE 4        human gate
```

## Entry-point skills (you invoke these)

- **`build`** `<request or client email>` — the full team loop on a real job.
- **`discovery`** `<idea or edit>` — pressure-test value (GO/NO-GO/RESHAPE); builds nothing.
- **`quick`** `<small change>` — fast path for tiny edits: branch + atomic commit, no full loop.
- **`ship`** `<change>` — dev→prod promotion checklist (human-gated).
- **`progress`** — read `.planning/` and report where the project stands / what's next.
- **`retro`** — fold lessons from the last run into the team's own definitions.

They're **skills**, not commands, so they're discovered globally on current Claude
Code and auto-trigger when relevant. `CLAUDE.md` tells the main session to reach for
them on its own — classify the task, then route to the lightest safe path.

## Method skills (the agents load these)

`discovery-value-proposition` · `discover-solution-space` · `architecture-design` ·
`work-breakdown` · `spec-state` · `dev-prod-isolation` · `code-review-rubric` ·
`verify-changes` · `agent-retro` — alongside consumed skills (`frontend-design`,
`make-research`, `skill-creator`, `doc-coauthoring`, `pptx`, `project-cleanup`).

## Durable state (`.planning/`)

A build keeps its memory on disk so long/overnight runs survive context resets:

```
.planning/PROJECT.md     what we're building + the one-line value proposition
.planning/ROADMAP.md     phases, each todo / in-progress / done
.planning/phases/NN/PLAN.md + SUMMARY.md   tasks (checkboxes) and completion reports
```

`progress` reads these; `build` writes them. See the `spec-state` skill.

## Install

**Globally (use the team in every project, plus the autonomy posture):**

```bash
bash scripts/install-global.sh        # agents + skills + CLAUDE.md → ~/.claude
# or, for the skills only, via agr:
agr sync -g
```

**Per project (skills, via agr):**

```bash
agr add mhogild/agent-resources/build      # or any skill name
agr sync                                   # everything in agr.toml
```

Agents live in `.claude/agents/`; copy them into another project's `.claude/` (or
install globally) to use the full team there.

## Layout

```
CLAUDE.md            operating manual / autonomy posture (also installed globally)
.claude/agents/      solution-architect, coder, code-reviewer, verifier
.claude/skills/      entry-point + method skills (+ consumed skills)
docs/                AGENT-TEAM.md (playbook), team-changelog.md
scripts/             install-global.sh
agr.toml             skill dependencies (consumed + first-party)
```

## Improving the team

The team is meant to evolve. After a run, `retro` finds where a gate was weak,
makes the smallest edit to the relevant agent/skill/`CLAUDE.md`, and logs it to
`docs/team-changelog.md`. Keep agent prompts lean; push detailed procedure into
skills. Re-run `scripts/install-global.sh` to push updates everywhere.
