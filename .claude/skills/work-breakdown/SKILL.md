---
name: work-breakdown
description: >
  Decompose a finished Design Doc into bounded, parallel-safe work units so two or
  more coders can build at once without colliding. Use after architecture-design,
  before spawning coders. Each unit has owned files, a frozen contract, and an
  integration order. This is the orchestrator's slicing tool.
---

# Work Breakdown

Slice the design into units that can be built **in parallel without collision**.
Bad slicing is the number-one cause of two-agent builds producing merge chaos and
broken contracts.

## How to slice

1. **Cut along the contracts**, not down the middle of a feature. Each unit should
   sit on one side of a frozen interface defined in the Design Doc.
2. **Assign file ownership.** Every unit lists the files/directories it may write.
   Ownership must not overlap. Shared files (types, schema, config) are either
   (a) owned by exactly one unit and depended on by others, or (b) frozen up front
   so no one edits them mid-build.
3. **Make each unit independently testable.** A unit isn't done until its own
   tests pass — without waiting on another unit.
4. **Define integration order.** Which unit lands first, what the second builds
   against, and the single integration step that joins them.
5. **Right-size.** A unit is one focused coder session. If it spans many unrelated
   areas, split it; if two units constantly need each other's files, merge them.

## Output

```
## Work Breakdown — <project>
### Shared / frozen (built or pinned first)
- types/contracts/schema owned by: <unit or "frozen, no edits">
### Unit 1 — <name>  (coder A)
owns: <files> · contract: <interface it fulfils> · tests: <what proves it> · depends on: <none|unit>
### Unit 2 — <name>  (coder B)
owns: <files> · contract · tests · depends on
### Integration
order · the join step · who runs it
```

Hand each unit to a separate coder. Tell each coder: read the whole Design Doc,
but **only write within your unit's owned files**; changing a shared contract is
an escalation to the orchestrator, never a silent edit.
