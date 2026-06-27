---
name: prototype-to-validate
description: >
  Build the cheapest possible artifact that retires the biggest risk BEFORE
  committing real engineering. Use in discovery whenever there's a meaningful value,
  usability, or feasibility unknown. Pick the prototype type that matches the risk,
  learn from it, and decide validate / refine / kill. Inspired by INSPIRED's
  discovery-prototyping.
---

# Prototype to Validate

A prototype is a question, not a product. Its only job is to answer "is this worth
building?" for a fraction of the cost of building it. Match the prototype to the
risk you're trying to retire.

## Pick by risk

- **Value risk** → a **fake-door / demand test**: a landing page, a "reserve" button
  that just records intent, an offer shown to a few real owners. Measures whether
  anyone actually wants it before a line of real code.
- **Usability risk** → a **user prototype**: a clickable mock or static flow a real
  person tries. Watch where they hesitate or fail. Fidelity only as high as needed
  to get an honest reaction.
- **Feasibility risk** → a **technical spike**: the smallest throwaway code that
  proves the hard part works (an API integration, a tricky calculation, a
  performance question). Owned by the tech-lead.
- **Viability risk** → a **back-of-envelope**: the cost/margin/GDPR/support-tail
  check on paper before building commits the agency to a support obligation.

## Rules

- **Cheapest thing that answers the question.** If a sketch settles it, don't build
  a clickable mock. Throwaway is fine and often correct.
- **Decide a falsifiable outcome up front** ("≥3 of 5 owners click reserve",
  "owner completes setup unaided"). Otherwise you'll rationalize anything.
- **Prototypes are not production.** Never promote prototype code to a client's live
  system; rebuild properly in delivery.

## Output

One short note: the risk, the prototype, what was observed, and the verdict —
**validated** (proceed), **refine** (adjust and re-test), or **kill** (stop, and
what that saved). Feeds the Product Brief in `product-discovery`.
