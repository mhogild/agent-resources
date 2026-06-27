---
name: platform-reliability
description: >
  Keep an always-on service reliable and its LLM spend under control — the concerns
  a one-off client site doesn't have. Use when building or auditing background jobs,
  queues, email/webhook ingestion, agent automation, or anything that must run
  unattended. Covers idempotency/retries, failure handling, observability, and LLM
  token-cost control. Gates promotion of platform features.
---

# Platform Reliability (always-on services)

A client's static booking page either works or it doesn't. A service desk that
ingests email, runs agents, and acts unattended fails in *subtle, expensive* ways —
duplicated work, silent drops, runaway token bills. This skill is the checklist for
making always-on work trustworthy.

## Jobs, queues & ingestion
- **Idempotency** — processing the same email/webhook/job twice must not double-act.
  Use idempotency keys / dedupe.
- **Retries with backoff + a dead-letter path** — transient failures retry; poison
  messages land somewhere visible, not in a silent loop.
- **Webhook/email intake** — verify signatures, ack correctly, and don't lose events
  if a worker dies mid-process. At-least-once delivery means design for duplicates.

## Failure handling
- **Timeouts and circuit breakers** on every third-party and LLM call; never block
  forever on a hung provider.
- **Graceful degradation** — when the model/provider is down, queue and inform,
  don't crash the desk.

## Observability (you can't run what you can't see)
- Structured logs with a request/tenant/job id, error tracking, and **health checks**.
- **Alert on the few things that should page you** (stuck queue, error spike, spend
  spike) — not on noise.

## LLM cost control (the one people forget)
- **Token budgets** per task/tenant; cap runaway agent loops with a step/again limit.
- **Right-size the model** — cheap model for cheap steps, the expensive one only
  where judgment pays; cache where inputs repeat.
- **Monitor spend** per tenant/feature and alert on anomalies. Token cost is
  cost-of-goods here; treat it like one.

## Data
- Migrations safe and **reversible**; backups verified; rollback rehearsed. (Env
  isolation itself is in `dev-prod-isolation`.)

## Output
A reliability verdict: each gap as `[severity] area — risk → fix`. Any blocker
(lost/duplicated work, no rollback, uncapped spend, no alerting on a critical path)
**blocks promotion** of the feature.
