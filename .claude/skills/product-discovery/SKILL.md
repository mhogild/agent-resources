---
name: product-discovery
description: >
  The INSPIRED-style discovery method the product trio runs together: tackle the
  four big product risks (value, usability, feasibility, viability) BEFORE building,
  with engineers in the room from the start, using cheap prototypes to de-risk. Use
  at the start of any inquiry, scaled to its size — a small feature gets a light
  pass, a new product gets the full treatment. Continuous: discovery stays ahead of
  delivery, it is not a one-time gate.
---

# Product Discovery (the four risks)

Discovery answers one question: *will this be worth building before we spend the
engineering to build it?* The trio runs it together — **product-manager**
(value + viability), **product-designer** (usability), **tech-lead** (feasibility) —
with engineers present from the start, not handed a finished spec. The goal is to
retire risk cheaply, not to write a big document.

## The four risks (own them explicitly)

1. **Value — will they use/buy it?** (PM) Painkiller vs vitamin, who pays for what
   outcome, real demand. The biggest killer; attack it first. Deep-dive with
   `discovery-value-proposition`.
2. **Usability — can they figure out how to use it?** (designer) The whole flow a
   real person walks, where they get stuck. De-risk with a prototype.
3. **Feasibility — can we build and run it?** (tech-lead) Hard/expensive/risky
   parts, better technical options, integrate-vs-build. Spike the real unknowns.
4. **Viability — does it work for the business?** (PM) Agency economics, margin,
   the support tail, GDPR/processor duties, what's build vs care-plan.

## How the trio works

- **Prototype before you build.** The cheapest artifact that retires the biggest
  risk — a clickable mock, a fake-door, a feasibility spike (load
  `prototype-to-validate`). Learning beats opinion.
- **Engineers early.** The tech-lead shapes the solution as it forms; the best
  technical idea often comes from the people closest to the tech.
- **Outcomes over output.** Frame the target as the customer/business outcome, not
  a feature list.
- **Continuous, scaled to size.** A copy tweak needs a one-line value check; a new
  booking product needs all four risks worked and a prototype. Discovery runs a
  step *ahead* of delivery, feeding it validated, de-risked work.

## Output

A **Product Brief** (write it to `.planning/PROJECT.md`): the customer & problem,
the outcome, each of the four risks with how it was tested (or the assumption still
open), the prototype's verdict, and a clear **GO / NO-GO / RESHAPE**. A GO authorizes
sprint delivery. Keep it terse — it's a decision record, not documentation.
