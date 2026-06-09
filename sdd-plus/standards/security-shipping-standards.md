# Security Shipping Standards

## Purpose

Use these standards when a change can affect whether a project is safe to deploy, expose, operate, or connect to real data and users.

These standards are generic and apply across stacks. They complement SDD+ change packets and the LaunchGuardian Framework spec.

## LaunchGuardian Requirement

LaunchGuardian Framework (LGF) is required for deployable projects.

Before launch or a material deployable change, create project-specific LGF records from the templates in `sdd-plus/security/` or update the existing project records.

## Agent Responsibilities

Codex and other agents may:

- identify whether LGF appears to apply
- propose applicable gates
- propose skipped gates and reasons
- draft inventories, threat models, role matrices, risk records, and launch decisions
- flag missing evidence or unresolved critical findings

Codex and other agents must not silently waive high-risk gates. Humans must confirm skipped high-risk gates.

## High-Impact Areas

Treat the following as high-impact:

- security controls or security assumptions
- authentication, authorization, sessions, identity, or permissions
- privacy, personal data, sensitive data, production data, or retention
- deployment, hosting, domains, networking, secrets, or environment configuration
- database schema, migrations, storage, backups, or destructive data operations
- frontend exposure, client-side tokens, public routes, CORS, CSP, or browser storage
- infrastructure, CI/CD, dependency policy, or supply-chain controls

High-impact changes require explicit documentation in the active SDD+ change packet and, when deployable, LGF artifact updates.

## Gate Confirmation

For each deployable change, record:

- which gates apply
- which gates do not apply
- who confirmed skipped high-risk gates
- what evidence supports each completed gate
- any unresolved findings or accepted risks

Skipped high-risk gates must include a human-confirmed reason.

## Required LGF Gates

Evaluate every gate for deployable projects:

- Scope & Permission
- Product, Asset & Data Inventory
- Threat Modeling
- Code Security
- Secrets & Config Hygiene
- Frontend Exposure
- API Auth & Object Authorization
- Injection & Input Safety
- Auth, Sessions & CSRF
- File Upload, SSRF, Imports & Exports
- Dependency, SBOM & Supply Chain
- Infrastructure, DNS, TLS & Web Hardening
- Resilience, DDoS, Abuse & Cost Defense
- Webhooks, Background Jobs & Integrations
- Privacy, Legal & Data Lifecycle
- AI/RAG/Agent Security
- Multi-Tenant & Internal Permission Isolation
- Observability, Logs & Incident Readiness
- Backup, Recovery, Deletion & Rotation
- Business Logic Abuse
- Launch Decision
- Continuous Monitoring

Each gate may be marked `applies: true`, `applies: false`, or `applies: unknown`. A gate marked `false` should include a reason, evidence when available, confidence, and human confirmation when the skipped gate is high-risk.

## Blocking Findings

Critical findings block launch.

A change must not be marked launch-ready while any critical finding remains open. Critical findings should be fixed, removed from scope, or converted into a non-critical finding only when new evidence justifies the downgrade.

High findings should block launch unless a human owner accepts the risk with a mitigation, due date, and rollback or containment plan.

## Required Evidence

Evidence should be concrete and durable:

- file paths, configuration names, or command output summaries
- links to issue trackers or review records when available
- test names, verification steps, or manual review notes
- named owners for follow-up work and accepted risks

Do not store secrets, credentials, tokens, or production data in LGF artifacts.

## Minimum Launch Record

A launch decision should include:

- scope summary
- gate status
- open findings by severity
- accepted risks
- rollback plan
- final decision
- human approver for launch or for skipped high-risk gates
