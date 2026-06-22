---
name: progress
description: >
  Report exactly where the current project stands and what to do next, by reading
  the .planning/ state files. Use at the start of a session, when resuming a long
  or overnight run, or any time you ask "where are we / what's left." Inspired by
  get-shit-done's progress command.
---

# /progress — where are we, what's next

Re-orient from disk, not from memory. Read the `.planning/` state (see the
`spec-state` skill) and give a short, honest status.

## Do
1. Read `.planning/PROJECT.md` (what + the value proposition), `.planning/ROADMAP.md`
   (phases and their status), and the current phase's `PLAN.md` (task checkboxes)
   and any `SUMMARY.md` files.
2. If there is no `.planning/` directory, say so — this project hasn't been put
   through the `build` loop yet; offer to start it.

## Report (keep it tight)
```
## Progress — <project>
Value prop: <one line from PROJECT.md>
Phase: <current phase> (<n> of <total>) — <status>
Done: <last 1-3 completed units>
Now / next: <the next unchecked task>
Blockers: <anything waiting on the human, e.g. a promotion approval>
```

End with the single most useful next action — usually "continue the build loop on
the next task," "run the verifier," or "this is waiting on your preview approval to
`ship`." Don't do the work here; just locate it.
