---
description: >
  Run the value-proposition discovery gate on an idea, project, feature, or edit —
  without building anything. Produces a critical Discovery Brief with a
  GO / NO-GO / RESHAPE verdict. Use to pressure-test "is this worth building?"
argument-hint: <the idea, feature, or edit to pressure-test>
---

# /discovery — pressure-test the value proposition

Delegate to the **solution-architect** in `discovery` mode. Its job is to be a
critical friend, not a cheerleader — find the weakest load-bearing assumption and
pull on it before anything gets built.

The thing to evaluate: **$ARGUMENTS**

The architect will load `discovery-value-proposition` and force the questions:
painkiller vs vitamin, who pays and for what outcome, the real scope/wedge, the
moat, liability/compliance, and the cheapest falsifying test. It will explore the
solution space (`discover-solution-space`) and return a **Discovery Brief** ending
in **GO / NO-GO / RESHAPE**.

For an **edit to an existing product**, the architect also checks: does this still
match the current value proposition, does it actually add value, and does it fit
the existing architecture — or is it drift?

Report the brief back to the user verbatim. Do not start designing or building
from a `/discovery` call — if the verdict is GO and the user wants to proceed,
that's a `/build`.
