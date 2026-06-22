---
name: verify-changes
description: >
  Mechanically verify that a change actually works before a human reviews it: run
  typecheck, lint, tests, and build, then produce a preview deployment URL. Use as
  the last automated gate before human approval — this is what makes unattended /
  overnight agent runs safe. Reports PASS/FAIL with evidence.
---

# Verify Changes

The mechanical safety net. Unattended agent work is only acceptable because this
gate stands between the agents and the human's review. Evidence, never assertion.

## The sequence (stop at the first hard failure; report it precisely)

1. **Detect the stack.** Read `package.json` scripts (or the project's
   equivalent) to find the real commands; don't assume.
2. **Install** clean (`npm ci` / `pnpm i --frozen-lockfile` / etc.).
3. **Typecheck** (`tsc --noEmit` or the project's typecheck script).
4. **Lint** (eslint/biome/etc.).
5. **Test** (unit + any integration/e2e). Capture the summary line.
6. **Build** the production build; it must succeed.
7. **Preview deploy.** Produce a live preview URL — Vercel/Netlify preview for a
   branch, or the project's staging mechanism (see `dev-prod-isolation`). The
   human reviews the *rendered result*, not a diff.

## Report format

```
## Verification — <branch>
| step       | result | note (failing output if RED)        |
| install    | PASS   |                                     |
| typecheck  | PASS   |                                     |
| lint       | PASS   |                                     |
| tests      | PASS   | 42 passed                           |
| build      | PASS   |                                     |
| preview    | PASS   | https://<preview-url>               |

VERDICT: GREEN | RED
```

## Hard rules

- **GREEN requires every step to have actually run and passed.** "I couldn't run
  the tests" is **RED**, not a pass. Inability to verify is a failure to verify.
- On RED, route back to the coders with the exact failing step and its output. Do
  not fix the code here — verification and implementation are separate roles.
- Only a GREEN verdict puts the work in front of the human for the promotion
  decision.
