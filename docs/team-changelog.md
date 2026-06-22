# Team Changelog

The evolution log of the agent team. `/retro` appends here whenever a run exposes
a weakness and a definition is edited to fix it. Newest first.

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
