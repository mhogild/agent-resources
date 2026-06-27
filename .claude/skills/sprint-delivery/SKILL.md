---
name: sprint-delivery
description: >
  Run delivery as iterative sprints of thin vertical slices, in parallel with
  ongoing discovery (dual-track). Use after a Product Brief is GO, to turn validated
  work into shipped increments. Each slice ships something demoable and passes
  review + verify. Scales from a one-sprint feature to a phased product. Agile/lean,
  outcomes over output.
---

# Sprint Delivery (dual-track)

Delivery is iterative, not a big-bang handoff. Discovery (the trio) stays a step
ahead, feeding validated, de-risked work into delivery sprints. Engineers build in
small increments that each produce something you can actually look at.

## Slice into vertical increments

- A slice is **thin and vertical** — it goes end to end (UI → logic → data) and
  delivers one visible piece of value, not a horizontal layer that demos nothing.
- The tech-lead orders slices so the riskiest/most-valuable land first, and uses
  `work-breakdown` to give each coder a bounded unit (owned files, a contract).
- Right-size a slice to roughly one focused coder session. A sprint is one or a few
  slices that together reach a demoable milestone.

## The sprint loop (repeat per increment)

1. **Plan** the slice(s) for this sprint; record them as checkboxes in the phase
   `PLAN.md` (see `spec-state`).
2. **Build** — coders implement their units in parallel, in dev only
   (`dev-prod-isolation`), each with tests, each an **atomic commit**.
3. **Review** — tech-lead (architecture) + code-reviewer (correctness/security) via
   `code-review-rubric`; designer checks the experience.
4. **Verify** — the verifier runs `verify-changes` and produces a preview URL.
5. **Demo** — show the human the working increment (the preview, not a diff). Their
   reaction feeds the next sprint and ongoing discovery.

## Discipline

- **Outcomes over output.** A sprint succeeds if it moved the target outcome, not if
  it closed tickets. Cut scope, not quality, to protect the increment.
- **Discovery stays ahead.** If a slice hits an unvalidated assumption, kick it back
  to discovery (`product-discovery` / `prototype-to-validate`) rather than guessing.
- **Promotion stays human-gated.** Increments live in dev/preview; `ship` moves an
  approved increment to prod. Write a `SUMMARY.md` at each phase boundary.

## Scaling
- **Feature request:** often one short sprint of one or two slices.
- **New product:** several phases, each a few sprints, discovery running ahead the
  whole way.
