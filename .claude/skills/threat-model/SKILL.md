---
name: threat-model
description: >
  System-level security analysis for a live, multi-tenant service that holds other
  people's data or runs agents on untrusted input. Use when building or auditing any
  always-on platform with auth, secrets, tenant isolation, or an LLM/Agent-SDK
  boundary (e.g. an AI-native service desk). Deeper than the diff-level
  code-reviewer: it models the whole system's assets, trust boundaries, and threats,
  and gates promotion of platform features.
---

# Threat Model (system-level security)

The `code-reviewer` checks a *diff* for bugs and obvious security issues. This skill
is the level above: it reasons about the **whole system** — what's worth stealing,
where the trust boundaries are, and how each one could be crossed. Run it for
platform software that holds client data or acts on untrusted input.

## Method

1. **List the assets.** Client/customer PII, ticket/email content, secrets and API
   keys (Anthropic/Azure, Supabase service-role), session tokens, audit logs.
2. **Draw the trust boundaries.** tenant ↔ tenant, user ↔ system, app ↔ database,
   app ↔ LLM/Agent-SDK, app ↔ third-party (email, webhooks, payment). Every boundary
   is a place to attack.
3. **Walk threats per boundary** (a lightweight STRIDE pass): spoofing, tampering,
   info disclosure, denial of service, elevation of privilege.

## The concerns that matter most for an AI-native, multi-tenant platform

- **Tenant isolation.** Every query and route scoped to the current tenant; turn on
  **Supabase Row-Level Security** and verify it; no IDOR (guessable ids returning
  another tenant's data). The #1 risk for a multi-client tool.
- **AuthN/Z on every protected path** — not just the UI, the API routes and server
  actions too. Default-deny.
- **Secrets** — never in code, logs, client bundles, or the LLM/agent context;
  per-environment; service-role keys server-only; a rotation story.
- **The Agent-SDK / LLM boundary (the novel one).** Ingested emails/tickets are
  **untrusted input**. Treat them as a prompt-injection vector: content that tries to
  steer the agent into actions or data exfiltration. Constrain the agent's tools and
  permissions, never let untrusted text silently authorize a privileged action,
  sanitize/scope what the model can read and do, and review what data leaves to the
  model provider (GDPR/DPA).
- **PII & GDPR** — you're a **processor** for client data: minimize, set retention,
  keep an audit trail, honor deletion.

## Output

A short **threat register**: each finding as `[severity] boundary/asset — threat →
mitigation`, severities per `code-review-rubric` (blocker/high/medium/nit). Any
blocker (e.g. cross-tenant leakage, a secret in the client, an unconstrained agent
acting on untrusted input) **blocks promotion**. Complements — does not replace —
the diff-level `code-reviewer` and `dev-prod-isolation`.
