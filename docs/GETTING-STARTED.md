# Getting Started — you just got hired to use this team

Welcome. This explains, from zero, how to actually *use* this team. No prior
knowledge assumed.

## What this is, in one paragraph

You are the head of a small **product team** — except the team is made of AI
specialists running inside Claude Code. You bring in a job (a client wants a booking
page, a café wants their menu updated, someone has an idea). The team figures out
whether it's worth building, designs it, builds it in small steps, checks its own
work, and hands you a **live preview to look at**. You stay the boss: you approve
what gets built and what goes live. The team does the production; **you review the
final product**, not every keystroke.

## Your team (who does what)

- **Product Manager** — the "is this worth doing, and for whom?" person. Expert in
  the customer, the numbers, the business, and the industry. Leads the thinking.
- **Product Designer** — the "is this actually usable?" person. Owns the whole
  experience and builds quick mock-ups to test ideas cheaply.
- **Tech Lead** — the senior engineer who's involved *from the start*, decides how
  it's built, and keeps the build sound.
- **Coders (engineers)** — build the real thing in small, testable pieces.
- **Code Reviewer** — checks for bugs and security problems.
- **Verifier** — runs the tests and gives you a clickable preview link.

You don't manage them individually. You talk to the team as a whole, and it routes
the work itself.

## The one thing to understand: two tracks

1. **Discovery** — *should we build this, and what exactly?* The PM, Designer, and
   Tech Lead work this out together and, when there's doubt, build a cheap prototype
   to test it before spending real effort.
2. **Delivery** — *build it in sprints.* Engineers build it in small slices; each
   slice is reviewed, tested, and shown to you as a preview.

Discovery stays a step ahead of delivery, so you're never building something nobody
validated.

## How you actually use it (day to day)

You mostly just **describe the job in plain language** and let the team route
itself. If you want to be explicit, these are the things you can type:

| You type… | …and the team |
|---|---|
| `build <the job / paste the client email>` | runs the whole loop: discovery → design → sprints → preview |
| `discovery <an idea>` | just pressure-tests whether it's worth building (builds nothing) |
| `quick <a tiny change>` | makes a small, safe edit fast (e.g. fix a typo, change opening hours) |
| `progress` | tells you where the current job stands and what's next |
| `ship <the change>` | promotes an approved change to the live site (after you OK the preview) |
| `retro` | improves the team itself after a job |

You usually won't even type these — once installed, the team reads the situation and
picks the right path. Naming one is just you overriding.

## What's expected of *you* (the human gates)

The team is deliberately built so it **stops and asks you at three moments**:

1. **Scope check.** If discovery says "this is a vitamin, not worth it" (NO-GO) or
   "build this narrower thing instead" (RESHAPE), you decide whether to proceed.
2. **Preview review.** After each sprint, you get a live URL. You look at the *real
   thing* (not code) and say "good" or "change this."
3. **Go-live approval.** Nothing reaches a client's live site until you approve it
   via `ship`. The team never pushes to production on its own.

Everything else — research, design, coding, testing — it handles.

## A real example, start to finish

> A café emails: "Can people book a table on our site?"

1. You paste the email after `build`.
2. **Discovery:** the PM asks *is online booking a real painkiller for this café, or
   would a phone number do?* The Designer sketches the booking flow; the Tech Lead
   says *we'll integrate a proven booking tool, not build one from scratch.* They may
   throw up a quick prototype. Out comes a **GO** with a one-line goal: *"a customer
   can book a table in under a minute."*
3. **You** get the brief and say go.
4. **Delivery:** the team builds it in a couple of slices — first the booking form,
   then confirmation emails — each shown to you as a preview as it lands.
5. **You** click the preview, try booking a table, say "looks great."
6. **`ship`** puts it live after you approve; you get the live URL and a one-line
   "how to undo" in case anything looks off.

If you'd come back a day later and typed `progress`, it would tell you exactly which
slice was done and what was next.

## Setup (one time)

```bash
git clone https://github.com/mhogild/agent-resources && cd agent-resources
bash scripts/install-global.sh      # installs the team into ~/.claude for every project
```

Then open any project in Claude Code and start describing jobs.

## When you feel lost

- Type **`progress`** — it re-reads the project state and tells you where things are.
- Read the deeper **[playbook](AGENT-TEAM.md)** if you want to understand the gears.
- The team is meant to improve: after a bumpy job, type **`retro`** and it tunes
  itself.

That's it. Describe the work, review the previews, approve what goes live.
