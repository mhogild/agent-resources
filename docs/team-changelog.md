# Team Changelog

The evolution log of the agent team. `/retro` appends here whenever a run exposes
a weakness and a definition is edited to fix it. Newest first.

## 2026-06-27 — servicedesk install path
- Added `scripts/bootstrap-into-repo.sh` (agent-resources is public, so no auth) to
  install the team's `.claude/` + the servicedesk `CLAUDE.md` into any target repo,
  including Claude Code on the web sessions.
- Added `docs/servicedesk-setup.md`: how to bring the team to servicedesk and ask it
  for a code-level feasibility audit in a session that has the real code.

## 2026-06-27 — internal-platform profile (servicedesk fit)
- Adapted the team for internal/platform software (the agent-resources team was tuned
  for client deliverables; servicedesk is an own, always-on, multi-tenant platform).
- New skills: `threat-model` (system-level security — tenant isolation, secrets, the
  Agent-SDK/untrusted-input boundary, GDPR) and `platform-reliability` (jobs/queues/
  ingestion idempotency, failure handling, observability, LLM cost control). Both gate
  promotion for platform features.
- Added an **internal platform / tooling variant** to `product-discovery` (value = ROI,
  viability = run-cost + security, not market demand) and pointed `tech-lead` at the
  two new skills for platform work.
- Added `templates/servicedesk-CLAUDE.md` — a drop-in repo profile that re-points the
  trio for servicedesk without building a separate team. Wired skills into agr.toml.

## 2026-06-27 — INSPIRED product-team model
- Reshaped the judgment role into a real product **trio** (Marty Cagan, *INSPIRED*):
  replaced the single `solution-architect` with `product-manager` (value + viability;
  customer/data/business/industry expert), `product-designer` (usability + experience;
  prototyping), and `tech-lead` (feasibility + architecture; engineer in discovery
  early, leads delivery, reviews architecture).
- Reframed `build` as a **dual-track** loop: continuous discovery (the trio tackling
  the four risks — value/usability/feasibility/viability — and prototyping to de-risk)
  feeding **sprint delivery** of thin vertical slices. Ceremony scales to the inquiry
  (feature vs new product).
- New skills: `product-discovery`, `prototype-to-validate`, `sprint-delivery`.
- Updated `coder` (engineers are partners building in sprints), `discovery`,
  `code-review-rubric`/`code-reviewer` (architecture dimension now owned by tech-lead),
  CLAUDE.md (team + engineers-early non-negotiable), README, AGENT-TEAM playbook.
- Added `docs/GETTING-STARTED.md` — a newcomer's guide.

## 2026-06-22 — get-shit-done influence + autonomy pass
- Studied the real get-shit-done repo and folded in its core ideas: durable
  `.planning/` state (`spec-state` skill), fresh-context delegation, atomic commits,
  a quick path (`quick` skill), and a progress reporter (`progress` skill).
- Converted the workflow entry points from `.claude/commands/` to **skills**
  (`build`, `discovery`, `ship`, `retro` + new `quick`, `progress`) — globally
  discoverable on current Claude Code (which stopped scanning user-level
  `commands/`) and auto-triggering, i.e. more autonomous.
- Added `CLAUDE.md` operating manual: the main session now classifies each task and
  routes to the lightest safe path on its own, and reaches for skills proactively.
  Installed to `~/.claude/CLAUDE.md` by the install script.

## 2026-06-22 — Team established
- Created the initial team: orchestrator (`/build`), `solution-architect`
  (discovery/design/review modes), two parallel `coder`s, `code-reviewer`
  (correctness/security), `verifier` (QA/preview gate).
- Created the skill library: discovery-value-proposition, discover-solution-space,
  architecture-design, work-breakdown, dev-prod-isolation, code-review-rubric,
  verify-changes, agent-retro.
- Commands: `/build`, `/discovery`, `/ship`, `/retro`.
- Design principles baked in: discovery is a GATE not advice; verification is
  mandatory before human review; dev/prod isolation guards every live system;
  the team improves itself via `/retro`.
