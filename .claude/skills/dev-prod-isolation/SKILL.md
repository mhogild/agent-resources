---
name: dev-prod-isolation
description: >
  The safety playbook for any client-facing system: isolate dev from prod, build
  on branches with preview deploys, keep a human promotion gate, and never let an
  agent touch production data or credentials. Use whenever building or editing a
  live system, especially under "generously allow edits, I only review the final
  product." This is what makes that review gate meaningful.
---

# Dev / Prod Isolation & the Promotion Gate

"I only review the final product" is safe **only if** the review gate sits between
a sandbox and the live system. This skill defines that gate. Never let an agent's
edits land on a live booking system / webshop / site without it.

## Rules (non-negotiable)

1. **One isolated workspace per client.** A repo each, or a monorepo with
   per-client packages. No shared state between clients.
2. **At least two environments per client: dev/staging and prod.** Agents work in
   **dev only**, on a **branch**.
3. **Dev gets its own seeded / anonymized database.** Never the production DB,
   never production credentials, never real customer PII in dev. This is also a
   GDPR requirement, not just hygiene.
4. **Secrets stay out of the agent's context.** Use environment variables / a
   secrets manager; the agent references names, not values.
5. **The human gate is the dev→prod promotion.** The agent produces a **preview
   deployment (a live URL)**; the human reviews the *rendered result*, not a diff;
   on approval it merges and deploys. Approval is explicit and per-change.
6. **Backups + one-click rollback on every prod environment.** Before any prod
   deploy, confirm a rollback path exists.

## Concrete defaults (Next.js + Vercel/Netlify)

- **Preview per branch:** every branch/PR gets an automatic preview URL — this is
  the review surface. Trivial on Vercel/Netlify/Cloudflare Pages.
- **Branching:** `main` → prod, `dev`/feature branches → preview. Agents never
  push to `main`; promotion is a reviewed merge.
- **Databases:** separate dev and prod database URLs (e.g. Neon branch DBs or two
  Supabase projects). Migrations run in dev/preview first.
- **Env vars:** scoped per environment in the host's dashboard; production secrets
  are not present in dev.

## The promotion checklist (run before every dev→prod)

- [ ] Verifier is GREEN (build + tests pass, preview URL works).
- [ ] Reviewers APPROVED (architecture + correctness/security).
- [ ] Human approved the rendered preview.
- [ ] Prod backup taken / rollback path confirmed.
- [ ] No dev-only data, seeds, or secrets are being promoted.

Only when every box is checked does the change move to prod.
