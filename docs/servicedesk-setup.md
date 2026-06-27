# Bringing the team to servicedesk (and asking it for a feasibility audit)

Goal: have the product team **available inside servicedesk's Claude Code sessions**,
so you can call the agents to audit the real servicedesk codebase. Because
`agent-resources` is a **public** repo, this needs no tokens and works from a phone.

## One-time setup (do this once)

1. In the Claude mobile app or claude.ai/code, **start a session on `mhogild/servicedesk`**
   (pick it as the repository).
2. Paste this single instruction:

   > Run the agent-resources bootstrap to install the product team into this repo with
   > the servicedesk profile, then commit it:
   > `bash <(curl -fsSL https://raw.githubusercontent.com/mhogild/agent-resources/main/scripts/bootstrap-into-repo.sh) servicedesk`
   > If the curl-pipe is blocked, instead clone `https://github.com/mhogild/agent-resources`,
   > copy its `.claude/agents/` and `.claude/skills/` into this repo's `.claude/`, and copy
   > its `templates/servicedesk-CLAUDE.md` to this repo root as `CLAUDE.md`. Then
   > `git add .claude CLAUDE.md && git commit`.

That commits the team's agents, skills, and the internal-platform `CLAUDE.md` into
servicedesk. From now on, every servicedesk session loads them automatically (Claude
Code on the web loads a repo's committed `.claude/` and `CLAUDE.md`).

> Updating later: re-run the bootstrap (or `git pull` agent-resources and re-copy) to
> refresh the team. Pin to a tag if you want servicedesk on a fixed version.

## Then: ask the team to audit feasibility

In that same servicedesk session — which now has both the team **and** the real code —
ask:

> Act as the product team. The internal-platform `CLAUDE.md` is in effect. Audit this
> codebase for feasibility and fit:
> 1. structure, maturity, test coverage — would the sprint/verify loop work here?
> 2. run `threat-model`: multi-tenant isolation (Supabase RLS / IDOR), secrets, the
>    Agent-SDK / untrusted-email boundary, GDPR-processor duties.
> 3. run `platform-reliability`: jobs/queues/ingestion idempotency, failure handling,
>    observability, LLM token-cost control.
> 4. verdict: where is this solid, where would the team struggle, and the top fixes.

You can also call a single specialist directly, e.g. *"use the tech-lead agent to do
the feasibility + architecture pass"* or *"run the `discovery` skill (internal-platform
variant) on whether feature X is worth building."*

## Notes

- The audit happens **in the servicedesk session**, not here — that session is the only
  place that has servicedesk's actual code.
- Nothing the team does touches prod: it works on a branch in dev/preview, and
  promotion stays human-gated (`ship`).
