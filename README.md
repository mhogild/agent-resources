# agent-resources

A reusable **team of coding agents** for Claude Code, plus the skills they run on —
managed as dependencies with [`agr`](https://github.com/computerlovetech/agr).

Built for an agency workflow: you take in digital jobs for small businesses
(websites, booking systems, webshops, edits), the agents do the production behind
real safety gates, and **you review the final product** as a live preview before
anything reaches a client's live system. Designed so agents can run a long way on
their own without producing confidently-broken work.

→ **Full playbook: [`docs/AGENT-TEAM.md`](docs/AGENT-TEAM.md)**

## The team

| Role | What it is | Invoke |
|---|---|---|
| Team-lead / orchestrator | runs the whole loop, enforces the gates | `/build <request>` |
| Solution architect | discovery / design / architecture-review (a critical-by-default gate) | `solution-architect` agent · `/discovery` |
| Coder ×2 | build bounded units in parallel, in dev only, with tests | `coder` agent |
| Code reviewer | correctness + security | `code-reviewer` agent |
| Verifier (QA) | tests/build pass + a live preview URL | `verifier` agent |
| Self-improvement | tunes the team after each run | `/retro` |

The loop, with four gates that send work back when they fail:

```
discovery ─▶ design ─▶ work-breakdown ─▶ build (×2 coders) ─▶ review ─▶ verify ─▶ you approve preview ─▶ /ship
  GATE 1      GATE 2                                          GATE 3     GATE 4        human gate
```

## Commands

- `/build <request or client email>` — run the full team loop on a job.
- `/discovery <idea or edit>` — pressure-test value (GO/NO-GO/RESHAPE), build nothing.
- `/ship <change>` — run the dev→prod promotion checklist (human-gated).
- `/retro` — fold lessons from the last run into the team's own definitions.

## Skills (this library's own)

`discovery-value-proposition` · `discover-solution-space` · `architecture-design` ·
`work-breakdown` · `dev-prod-isolation` · `code-review-rubric` · `verify-changes` ·
`agent-retro` — alongside the consumed skills (`frontend-design`, `make-research`,
`skill-creator`, `doc-coauthoring`, `pptx`, `project-cleanup`).

## Install

**Globally (use the team in every project on this machine):**

```bash
bash scripts/install-global.sh        # copies agents + commands + skills into ~/.claude
# or, for the skills only, via agr:
agr sync -g
```

**Per project (just the skills, via agr):**

```bash
agr add mhogild/agent-resources/discovery-value-proposition
agr add mhogild/agent-resources/dev-prod-isolation
# ...etc; or `agr sync` to install everything in agr.toml
```

Agents and commands live in `.claude/agents/` and `.claude/commands/`; copy them
into another project's `.claude/` (or install globally as above) to use the full
team there.

## Layout

```
.claude/agents/      solution-architect, coder, code-reviewer, verifier
.claude/commands/    build, discovery, ship, retro
.claude/skills/      the team's skills (+ consumed skills)
docs/                AGENT-TEAM.md (playbook), team-changelog.md
scripts/             install-global.sh
agr.toml             skill dependencies (consumed + first-party)
```

## Improving the team

The team is meant to evolve. After a run, `/retro` finds where a gate was weak,
makes the smallest edit to the relevant agent/skill/command file, and logs it to
`docs/team-changelog.md`. Keep agent prompts lean; push detailed procedure into
skills. Re-run `scripts/install-global.sh` to push updates everywhere.
