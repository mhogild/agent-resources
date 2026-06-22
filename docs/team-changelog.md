# Team Changelog

The evolution log of the agent team. `/retro` appends here whenever a run exposes
a weakness and a definition is edited to fix it. Newest first.

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
