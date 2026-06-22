# The Agent Team — Playbook

A production-oriented team of coding agents for Claude Code, built for the way you
work: you take in digital jobs (websites, booking systems, webshops, edits) for
small businesses, the agents do the production, and **you review the final product
behind a real safety gate.** It's designed so agents can run a long way on their
own — even overnight — without you waking up to confidently-broken code.

It's inspired by harness-engineering practice (Plan→Work→Review loops, PlatformPlatform,
gsd) and distributed as `agr` skills plus Claude Code agents and commands.

## The core idea: gates, not vibes

A team of agents is only as safe as the gates between them. This team has four,
and **a failed gate sends work back — it is never waved through:**

```
  intake (a job / email / ticket)
        │
        ▼
  ┌──────────────┐   GATE 1  is this worth building?  (painkiller vs vitamin)
  │  DISCOVERY   │  ── NO-GO ▶ stop, explain.  RESHAPE ▶ confirm narrower scope.
  └──────────────┘            GO ▶ carry the one-line value proposition forward
        │
        ▼
  ┌──────────────┐   GATE 2  what exactly, and how?
  │  DESIGN      │  ── Design Doc with FROZEN CONTRACTS + dev/prod plan.
  └──────────────┘            No design ⇒ no code.
        │
        ▼
  work-breakdown → slice into parallel-safe units (owned files, no overlap)
        │
        ▼
  ┌──────────────┐   two CODERs build in parallel, dev/preview only, with tests
  │  BUILD       │
  └──────────────┘
        │
        ▼
  ┌──────────────┐   GATE 3  architecture review + correctness/security review
  │  REVIEW      │  ── CHANGES-REQUESTED ▶ back to the coder, re-review.
  └──────────────┘
        │
        ▼
  ┌──────────────┐   GATE 4  typecheck · lint · tests · build · PREVIEW URL
  │  VERIFY      │  ── RED ▶ back to coders with evidence.  GREEN ▶ to the human.
  └──────────────┘
        │
        ▼
  YOU review the rendered preview  →  ship promotes dev→prod (human-gated)
        │
        ▼
  retro folds lessons back into the team's own files
```

Throughout, the orchestrator keeps durable state in `.planning/` (see below) and
commits atomically, so a fresh context can resume exactly where the last one
stopped — the gsd discipline that makes overnight runs real rather than risky.

## The roster

| Role | Construct | Model | Why it exists |
|---|---|---|---|
| **Team-lead / orchestrator** | `build` skill (main session) | — | Sequences the loop, enforces gates, keeps `.planning/` state. It's the main session, not a subagent, because only the main thread can actually coordinate and spawn the others. |
| **Solution architect** | `solution-architect` agent (3 modes) | opus | The judgment role. `discovery` = value-prop gate; `design` = the build's contracts; `review` = architecture + value-prop-drift check. Critical by default. |
| **Research scout** | `make-research` skill (reused) | — | Pure observation of existing code before changing it. You already owned this. |
| **Coder ×2** | `coder` agent (spawn in parallel) | sonnet | Build a single bounded unit each, with tests, in dev only. |
| **Code reviewer** | `code-reviewer` agent | opus | Correctness + security — the bugs that bite in prod. Separate from architecture review. |
| **Verifier (QA)** | `verifier` agent | sonnet | The mechanical gate: tests/build pass + a live preview URL. This is what makes unattended runs safe. |
| **Self-improvement** | `agent-retro` skill + `retro` | — | Edits the team's own definitions after each run so it needs fewer corrections over time. |

### Why these additions to your original five
You asked for a team-lead, a discovery architect, two coders, and an architecture
reviewer. Three things were added because the setup is unsafe without them:
- **A verifier.** "Agents run overnight, I review the final product" only works if
  something mechanical proves the build works first. Otherwise the review gate is
  reviewing rubble.
- **A separate correctness/security reviewer.** Architecture-fit and "is it
  correct and safe" are different questions; one reviewer optimizing for both does
  neither well.
- **A retro loop.** You said the agents should be tuned after each use — that's a
  first-class skill, not an afterthought.

## The model/cost map
Judgment roles (discovery, design, review) run on **opus**; throughput roles
(coding, verification) run on **sonnet**. This keeps a deep agentic session's
token cost where it belongs — a rounding error against a project's price — while
spending the expensive model only where judgment pays for itself. Adjust per task:
a hard algorithmic unit may warrant opus for a coder; a trivial copy change may not
warrant the full loop at all.

## How this maps to your agency

- **Discovery** is the behavior from your servicedesk discovery session, made
  reusable and turned into a gate. Every new client job — and every edit to an
  existing one — passes through it: *painkiller or vitamin? who pays? does this
  still match the value proposition? does the edit fit the architecture?* That's
  exactly the "understand the value before building" instinct you wanted, enforced.
- **dev-prod-isolation** is the heart of doing this for real clients: one workspace
  per client, agents build only in dev/preview against seeded data, and **you
  promote to prod by approving a live preview URL** — never a diff, never an agent
  pushing to a live booking system.
- The default stack (Next.js + Vercel/Netlify, preview-per-branch) is chosen for
  exactly the preview→approve→promote flow your model needs.

## Autonomy & the get-shit-done influence

The first cut had gates but no memory, and you had to name a command for each step.
Three things from [get-shit-done](https://github.com/gsd-build/get-shit-done) close
that gap and make the team genuinely autonomous:

- **Durable state in `.planning/`.** A build writes `PROJECT.md` (what + the value
  proposition), `ROADMAP.md` (phases + status), and per-phase `PLAN.md`/`SUMMARY.md`.
  Long or overnight runs resume from disk, not from a degrading chat context. See
  the `spec-state` skill; read it any time with the `progress` skill.
- **Fresh-context delegation.** Each specialist (research, coding, review, verify)
  runs in its own clean window; the main session stays lean. This is how the team
  avoids "context rot" on big jobs.
- **A quick path + atomic commits.** Not every task earns the full loop — `quick`
  handles small edits with a branch and one clean commit. Every task is its own
  atomic commit so git history and `.planning/` agree.

And **`CLAUDE.md`** is the operating posture: when a task arrives, the main session
classifies it and routes to the lightest safe path on its own (idea → `discovery`,
tiny edit → `quick`, real build → `build`, resume → `progress`), and reaches for
the right method skills without being told. That's the "more autonomous, fits my
style" layer.

## Using it

- **A whole job:** `build <paste the request or client email>` — runs the full loop.
- **Pressure-test an idea/edit:** `discovery <the idea>` — GO/NO-GO/RESHAPE, builds nothing.
- **A small edit:** `quick <the change>` — fast path, still safe.
- **Where are we:** `progress` — reads `.planning/`, says what's next (great for resuming).
- **Promote an approved change:** `ship <change>` — the dev→prod checklist.
- **Tune the team:** `retro` — applies lessons to the agent/skill/`CLAUDE.md` files.
- The subagents (`solution-architect`, `coder`, `code-reviewer`, `verifier`) are
  also invokable directly when you want one step.

You usually won't type these — with `CLAUDE.md` installed, the session routes
itself. Naming a skill is the override, not the default.

## Extending the team
Add a skill with the `skill-creator` skill, drop new agents in `.claude/agents/`,
new entry points as skills in `.claude/skills/`, then re-run
`scripts/install-global.sh` (or `agr sync -g`) to push the update everywhere. Keep
agent prompts lean and push the detailed "how" into skills — the progressive-
disclosure pattern that keeps the harness maintainable. Let `retro` drive most
changes; resist accreting rules.
