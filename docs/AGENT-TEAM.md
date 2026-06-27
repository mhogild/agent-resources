# The Agent Team — Playbook

A production-oriented **product team** for Claude Code, built for the way you work:
you take in digital jobs (websites, booking systems, webshops, edits) for small
businesses, the team does the production, and **you review the final product behind
a real safety gate.** It's designed to run a long way on its own — even overnight —
without you waking up to confidently-broken code.

It blends three influences:
- an empowered **product team** — a PM/designer/engineer trio, continuous discovery,
  the four product risks, and dual-track sprints (Marty Cagan, *INSPIRED*);
- **gated, role-based delegation** (PlatformPlatform-style);
- **spec-driven, context-disciplined execution** from
  [get-shit-done](https://github.com/gsd-build/get-shit-done) — durable `.planning/`
  state, fresh-context subagents, atomic commits, a quick path.

## The core idea: two tracks, gated, never waved through

Work runs as **two parallel tracks**. Discovery decides *what's worth building* and
stays a step ahead of delivery, which *builds it in sprints*. Every gate sends work
back when it fails.

```
INTAKE (a job / email / ticket)  →  size it: tiny edit→quick · feature→light · product→full
        │
        ▼
╔══════════════════════ DISCOVERY TRACK (continuous, the trio) ══════════════════════╗
║  product-manager (value+viability) · product-designer (usability) · tech-lead       ║
║  (feasibility) — engineers in the room from the START.                              ║
║  Tackle the FOUR RISKS, prototype to de-risk (cheap), then decide.                  ║
║      └─ GATE: Product Brief → NO-GO ▶ stop · RESHAPE ▶ renarrow · GO ▶ value prop    ║
╚═════════════════════════════════════════════════════════════════════════════════════╝
        │  (discovery stays ahead, feeds validated, de-risked work down ↓)
        ▼
╔══════════════════════ DELIVERY TRACK (sprints of thin vertical slices) ═════════════╗
║  tech-lead: Design Doc + FROZEN CONTRACTS + dev/prod plan, slice the work           ║
║  per sprint:  coders BUILD (parallel, dev only, tests, atomic commits)              ║
║               → GATE review: tech-lead (architecture) + code-reviewer (correct/sec) ║
║               → GATE verify: typecheck·lint·tests·build·PREVIEW URL                  ║
║               → DEMO the increment to you (rendered preview, not a diff)             ║
╚═════════════════════════════════════════════════════════════════════════════════════╝
        │
        ▼
  YOU approve the preview  →  ship promotes dev→prod (human-gated)  →  retro tunes the team
```

The orchestrator keeps durable state in `.planning/` and commits atomically, so a
fresh context resumes exactly where the last one stopped — the discipline that makes
overnight runs real rather than risky.

## The four product risks (what discovery actually does)

Discovery's whole job is to retire these cheaply *before* engineering spends on them:

| Risk | Question | Owner |
|---|---|---|
| **Value** | will they use / pay for it? (painkiller vs vitamin) | product-manager |
| **Usability** | can a real person actually use it? | product-designer |
| **Feasibility** | can we build and run it sanely? | tech-lead |
| **Viability** | does it work for the agency (margin, GDPR, support tail)? | product-manager |

Attack value first — it's the biggest killer — and **prototype** (a fake-door, a
clickable mock, a feasibility spike) instead of arguing.

## The roster

| Role | Construct | Model | Why it exists |
|---|---|---|---|
| **Orchestrator** | `build` skill (main session) | — | Runs both tracks, enforces gates, keeps `.planning/`. The main thread, not a subagent — only it can coordinate and spawn the others. |
| **Product manager** | `product-manager` agent | opus | Value + viability. Expert in customer/data/business/industry. Leads discovery; holds the value proposition; critical by default. |
| **Product designer** | `product-designer` agent | sonnet | Usability + the whole experience. Prototypes to validate; produces production UI via `frontend-design`. |
| **Tech lead** | `tech-lead` agent | opus | Feasibility + architecture. The engineer *in discovery early*; owns the contracts; leads delivery; reviews architecture. |
| **Coder ×N (engineers)** | `coder` agent (parallel) | sonnet | Build vertical slices each sprint, with tests, in dev only. Partners, not spec-takers. |
| **Code reviewer** | `code-reviewer` agent | opus | Correctness + security — the bugs that bite in prod. |
| **Verifier (QA)** | `verifier` agent | sonnet | The mechanical gate: tests/build pass + a live preview URL. Makes unattended runs safe. |
| **Research scout** | `make-research` skill | — | Pure observation of existing code before changing it. |
| **Self-improvement** | `retro` skill | — | Edits the team's own definitions after each run so it needs fewer corrections over time. |

### How this evolved (the INSPIRED pass)
Earlier the judgment role was a single `solution-architect`. Splitting it into the
real **product trio** is what *INSPIRED* gets right: value/viability (PM),
usability/experience (designer), and feasibility/architecture (tech-lead) are
distinct competencies, and one role doing all three does each badly. The two changes
that matter most:
- **Engineers in discovery from the start.** Using engineers only to code gets half
  their value; the tech-lead surfaces feasibility and better solutions *as ideas
  form*, not after a spec is frozen.
- **Dual-track + prototypes.** Discovery runs continuously ahead of delivery and
  *prototypes to de-risk* before building — so sprints build validated work, not
  guesses. Adapted to an agency: ceremony scales to the inquiry (a feature ≠ a new
  product), and we don't pretend a bar's booking page has a product-analytics team.

## The model/cost map
Judgment roles (PM, tech-lead, code-reviewer) run on **opus**; throughput roles
(designer production, coding, verification) on **sonnet**. This keeps a deep session's
token cost a rounding error against a project's price while spending the expensive
model only where judgment pays for itself. Adjust per task: a hard unit may warrant
opus for a coder; a trivial copy change skips the loop entirely (`quick`).

## How this maps to your agency

- **Discovery** is the behavior from your servicedesk session, now run by a trio with
  engineers present, and turned into a gate. Every new client job — and every edit —
  passes the four risks: *painkiller or vitamin? who pays? usable by a stressed
  owner? feasible and cheap to run? does it still match the value proposition?*
- **dev-prod-isolation** is the heart of doing this for real clients: one workspace
  per client, the team builds only in dev/preview against seeded data, and **you
  promote to prod by approving a live preview URL** — never a diff, never an agent
  pushing to a live booking system.
- **Sprints** mean you see working increments early and often, not a big-bang reveal
  at the end — and you can redirect cheaply between them.
- The default stack (Next.js + Vercel/Netlify, preview-per-branch) is chosen for
  exactly the preview→approve→promote flow your model needs.

## Autonomy & the get-shit-done influence

The team is genuinely autonomous because of three gsd-derived pieces:
- **Durable state in `.planning/`** (`PROJECT.md`, `ROADMAP.md`, per-phase
  `PLAN.md`/`SUMMARY.md`) so long/overnight runs resume from disk, not a degrading
  context. See `spec-state`; read it with `progress`.
- **Fresh-context delegation** — each specialist runs in its own clean window; the
  main session stays lean. This is how big jobs avoid "context rot."
- **A quick path + atomic commits** — `quick` handles small edits with a branch and
  one clean commit; every task is its own atomic commit.

And **`CLAUDE.md`** is the operating posture: the main session classifies each task
and routes to the lightest safe path on its own (idea → `discovery`, tiny edit →
`quick`, real build → `build`, resume → `progress`), reaching for method skills
without being told.

## Using it

- **A whole job:** `build <paste the request or client email>` — runs the dual-track loop.
- **Pressure-test an idea/edit:** `discovery <the idea>` — GO/NO-GO/RESHAPE, builds nothing.
- **A small edit:** `quick <the change>` — fast path, still safe.
- **Where are we:** `progress` — reads `.planning/`, says what's next (great for resuming).
- **Promote an approved change:** `ship <change>` — the dev→prod checklist.
- **Tune the team:** `retro` — applies lessons to the agent/skill/`CLAUDE.md` files.
- The subagents (`product-manager`, `product-designer`, `tech-lead`, `coder`,
  `code-reviewer`, `verifier`) are also invokable directly when you want one step.

You usually won't type these — with `CLAUDE.md` installed, the session routes itself.
Naming a skill is the override, not the default. New to the team? Read
[`GETTING-STARTED.md`](GETTING-STARTED.md).

## Extending the team
Add a skill with the `skill-creator` skill, drop new agents in `.claude/agents/`, new
entry points as skills in `.claude/skills/`, then re-run `scripts/install-global.sh`
(or `agr sync -g`) to push the update everywhere. Keep agent prompts lean and push
the detailed "how" into skills — the progressive-disclosure pattern that keeps the
harness maintainable. Let `retro` drive most changes; resist accreting rules.
