---
name: discover-solution-space
description: >
  Explore the space of possible solutions before committing to one. Use after the
  problem is understood (research/discovery done) and before writing an
  architecture/design doc. Produces 2-3 genuinely distinct approaches with honest
  trade-offs and a recommendation, so the team commits deliberately, not by
  default.
---

# Discover the Solution Space

Step between understanding the problem and designing the build. The failure mode
this prevents: grabbing the first plausible approach and discovering its walls
halfway through implementation.

## Method

1. **Restate the problem and constraints** in one short paragraph — the outcome
   to hit, the hard constraints (budget, stack, compliance, timeline, who
   maintains it).
2. **Generate 2-3 genuinely distinct approaches.** Not three flavors of the same
   idea — different axes: build vs. buy vs. integrate; bespoke vs. off-the-shelf
   (e.g. a SaaS booking tool + thin glue vs. a custom system); static vs. dynamic;
   sync vs. async/queue.
3. For each approach capture:
   - **How it works** (a few lines).
   - **Cost** to build and to *run/maintain* (the maintenance cost is usually the
     decider for a solo operator).
   - **Risks / unknowns** and what would have to be true for it to work.
   - **Fit** to the value proposition and the team's ability to deliver it.
4. **Recommend one**, and say plainly why the others lost. Note the cheapest spike
   that would de-risk the recommendation.

## Output

```
## Solution Options — <problem>
### Option A — <name>
how · cost(build/run) · risks · fit
### Option B — <name>
...
### Recommendation
<which, and why the others lost> · <spike to de-risk>
```

Bias toward the simplest thing that serves the value proposition. Prefer
integrating a proven tool over building bespoke unless bespoke is the moat.
