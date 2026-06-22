---
name: code-review-rubric
description: >
  The shared review rubric for the team. Use when reviewing a diff. Covers three
  dimensions — architecture/design-fit (solution-architect), correctness, and
  security (code-reviewer). Defines severities and a verdict format so reviews are
  specific, falsifiable, and gate promotion consistently.
---

# Code Review Rubric

A review is a gate, not a vibe. Every finding is specific, falsifiable, and tagged
with a severity. Two reviewers use this: the solution-architect (architecture
section) and the code-reviewer (correctness + security sections).

## Severities

- **blocker** — breaks correctness/security or violates a contract; blocks
  promotion.
- **high** — likely to cause a real problem soon; fix before prod.
- **medium** — should fix; can be a fast follow.
- **nit** — style/clarity; optional.

## Dimension 1 — Architecture & design-fit (solution-architect)

- Does the code do what the Design Doc said, with the components and boundaries it
  specified?
- Are the **frozen contracts** honored, or did a coder leak across a boundary?
- **Value-prop drift:** does this still serve the one-line value proposition from
  the Discovery Brief, or did it quietly become a vitamin? Flag drift as high+.
- Maintainability: can one person own this later (the support-tail test)?

## Dimension 2 — Correctness (code-reviewer)

- Logic errors, off-by-one, wrong/missing async handling, unhandled
  errors/rejections, race conditions, broken edge cases, incorrect state.
- Contract implemented exactly as specified (types, nullability, error shapes)?
- Tests actually exercise the new behavior and its edges — run them, don't trust
  them by sight.

## Dimension 3 — Security (code-reviewer)

- Injection (SQL/command/template), XSS, SSRF, insecure deserialization.
- Authn/authz on every protected path; no insecure direct object references.
- Secrets not in code/logs; no prod data or credentials in dev (see
  `dev-prod-isolation`); PII handled lawfully.
- Dependency and supply-chain risk for anything newly added.

## Verdict format

```
## Review — <scope> (<dimension>)
- [severity] file:line — <what's wrong> → <concrete fix>
...
VERDICT: APPROVE | APPROVE-WITH-NITS | CHANGES-REQUESTED
```

Any blocker, or any unresolved security/correctness finding, ⇒ CHANGES-REQUESTED,
which blocks the promotion gate.
