---
description: >
  Run the dev→prod promotion gate for an approved change. Verifies every safety
  precondition before anything touches production, then promotes. Never promotes
  on unmet preconditions.
argument-hint: <the change/branch to promote, and target client/env>
---

# /ship — promote dev → prod (human-gated)

Promote an approved change to production. This is the most dangerous action the
team takes, so it is a checklist, not a vibe. Load `dev-prod-isolation` and run
its promotion checklist. **Do not promote if any box is unchecked.**

Promoting: **$ARGUMENTS**

## Preconditions (all must be true — verify, don't assume)
- [ ] **Verifier is GREEN** — build + tests pass and the preview URL works.
- [ ] **Reviewers APPROVED** — both architecture and correctness/security.
- [ ] **Human approved the rendered preview** — they saw the live result, not a
  diff, and said go.
- [ ] **Prod backup taken / rollback path confirmed.**
- [ ] **No dev-only data, seeds, or secrets** are being promoted; prod env vars
  are correct.

If any precondition is missing, stop and report exactly which one — do not
promote. Re-run the missing gate (`/build` phases, the verifier, or ask the user
for explicit approval) first.

## Promote
When every box is checked: merge to the prod branch (`main`) and deploy. Confirm
the prod deploy is healthy. State the rollback command in your report so the user
can revert in one step if anything looks wrong.

## After shipping
Report: what shipped, the prod URL, and the rollback path. Then suggest `/retro`
if anything in this cycle was bumpy.
