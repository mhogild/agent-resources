---
name: discovery-value-proposition
description: >
  Interrogate a project, feature, or business idea for its real value proposition
  BEFORE building. Use at the start of any new project or significant edit, or
  when asked "is this a good idea / worth building / what's the value." Forces the
  painkiller-vs-vitamin test, buyer/willingness-to-pay, scope, moat, and
  compliance, and ends in a GO / NO-GO / RESHAPE verdict. This is a GATE, not
  advice — nothing should be built past a NO-GO without a deliberate override.
---

# Discovery & Value Proposition

A critical-friend discovery method. Your job is to find the weakest load-bearing
assumption and pull on it before a line of code is written. Default stance:
skeptical. Never open with "great idea." Earn the GO.

This skill exists because of a hard-won lesson: **if discovery is advisory, build
agents route around it and ship vitamins.** So this produces a signed artifact
that gates the next step.

## The questions you must force (do not skip ahead)

1. **Buyer & pain.** Who pays? Is this a *painkiller* (they feel the pain weekly
   and it costs them money) or a *vitamin* (nice-to-have)? Struggling customers
   don't buy vitamins. Name the pain in one sentence or stop.
2. **Outcome & willingness to pay.** What measurable outcome results? Recovered
   no-shows, hours saved, leads caught? Would they pay for *that number*? A
   feature is not an outcome.
3. **Scope.** Is this a real, repeatable job, or undifferentiated "do anything"?
   "Any task with AI" is a solution hunting for a problem. Narrow to one
   job × one segment — the wedge.
4. **Moat / defensibility.** Why won't they DIY with ChatGPT, or churn to a
   cheaper option? Relationships, integration, reliability, accountability — not
   "we have agents."
5. **Liability & compliance.** Whose data? GDPR controller vs processor, secrets,
   uptime promises, the support tail you'll carry forever. A solo operator's real
   overhead.
6. **Cheapest falsifying test.** What's the smallest experiment that confirms or
   kills this? Who is the warm first customer? If there's no first customer, that
   is the finding.

## Anti-patterns to flag out loud

- **Vitamin dressed as painkiller** — a website/webshop for a segment that needs
  footfall, not a site.
- **Mission carrying the rent** — the most fragile customers are great for the
  mission, terrible for the livelihood. Separate them; don't let one fund the
  other by accident.
- **Scope sprawl** — "from code to brainstorm, any task."
- **Bottleneck/support-tail blindness** — every shipped system is maintenance you
  own. Cap how many live systems you carry; price maintenance explicitly.
- **Avoiding the wrong cost** — optimizing a rounding-error cost (e.g. tokens)
  while ignoring reliability/throughput, which is what actually matters.

## Output: the Discovery Brief

```
# Discovery Brief — <project>
Date · Author (solution-architect)

## The ask (as stated)
## Buyer & pain (painkiller or vitamin? why)
## Outcome & willingness to pay
## Scope / the wedge (one job × one segment)
## Moat
## Liability & compliance
## Options considered (link discover-solution-space)
## Cheapest falsifying test & first customer

## VERDICT: GO | NO-GO | RESHAPE
- If RESHAPE: the narrower thing actually worth building.
- If GO: the one-line value proposition the whole build must keep serving.
```

The GO brief's one-line value proposition becomes the yardstick every later
review measures drift against.
