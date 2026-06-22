---
name: quick
description: >
  The fast path for small, low-risk changes — a copy tweak, an obvious one-file
  fix, a config change. Gives you the team's safety guarantees (a branch, a clean
  atomic commit, dev-only) WITHOUT the full discovery→design→review loop. Use when
  the full build loop would be overkill. Inspired by get-shit-done's quick mode.
argument-hint: <the small change to make>
---

# /quick — small change, full safety, no ceremony

Not every task deserves the four-gate loop. This is the fast lane for changes that
are genuinely small and low-risk, while still keeping the guarantees that matter.

The change: **$ARGUMENTS**

## First, confirm it really is quick (one line)
A change qualifies as quick only if all are true:
- It touches a small, well-understood area (roughly one file / one obvious spot).
- It can't break a contract other code depends on.
- It carries no real correctness/security/data risk.

If any is false, say so and switch to the full `build` loop instead. When unsure,
it is not quick.

## Do it
1. Work on a **branch in dev** (never prod; see `dev-prod-isolation`).
2. Make the focused change. Match surrounding style.
3. If there's any behavior to it, add or update a test and run it. At minimum,
   typecheck/lint the touched files (load `verify-changes` for the commands).
4. **One atomic commit** with a clear message describing the change.
5. If a preview exists, give the human the preview URL to glance at before `ship`.

## Don't
- Don't silently expand scope into a refactor — that's a `build`.
- Don't skip the test/typecheck just because it's small.
- Don't promote to prod here; promotion stays human-gated via `ship`.
