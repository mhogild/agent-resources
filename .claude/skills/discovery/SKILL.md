---
name: discovery
description: >
  Pressure-test the value of an idea, project, feature, or edit — without building
  anything. Produces a critical Discovery Brief with a GO / NO-GO / RESHAPE
  verdict. Use at the start of anything new or uncertain, or when asked "is this
  worth building / what's the value." Run this before `build` on new directions.
argument-hint: <the idea, feature, or edit to pressure-test>
---

# discovery — pressure-test the value proposition

Delegate to the **solution-architect** in `discovery` mode. Its job is to be a
critical friend, not a cheerleader — find the weakest load-bearing assumption and
pull on it before anything gets built.

The thing to evaluate: **$ARGUMENTS**

The architect loads `discovery-value-proposition` and forces the questions:
painkiller vs vitamin, who pays and for what outcome, the real scope/wedge, the
moat, liability/compliance, and the cheapest falsifying test. It explores the
solution space (`discover-solution-space`) and returns a **Discovery Brief** ending
in **GO / NO-GO / RESHAPE**.

For an **edit to an existing product**, it also checks: does this still match the
current value proposition, does it actually add value, and does it fit the existing
architecture — or is it drift?

Report the brief back to the human. Do not start designing or building from a
discovery call. If the verdict is GO and the human wants to proceed, that's the
`build` loop — which will write the brief's value proposition into
`.planning/PROJECT.md`.
