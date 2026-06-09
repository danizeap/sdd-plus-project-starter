# LaunchGuardian Framework

## Purpose

LaunchGuardian Framework (LGF) is the SDD+ security-shipping layer for deployable projects.

It helps teams decide what security, privacy, deployment, and operational checks are required before a project is launched or materially changed. LGF is documentation-first: it records scope, applicable gates, evidence, accepted risks, and the final launch decision.

LGF does not implement a scanner, application runtime, policy engine, or automated security product by itself.

## When LGF Applies

LGF is required for deployable projects, including:

- public websites or web applications
- APIs, webhooks, workers, jobs, and services
- mobile, desktop, or CLI tools that connect to external systems
- internal tools that process sensitive, customer, production, or business-critical data
- infrastructure, deployment, authentication, authorization, database, storage, or networking changes

LGF may be skipped for documentation-only, local-only, or exploratory work when no deployable artifact, sensitive data, or persistent integration is affected. Skips should be recorded in the active SDD+ change packet.

## Framework Artifacts

Each deployable project should maintain project-specific LGF documents created from these templates:

- `sdd-plus/security/gate-applicability.template.yml`
- `sdd-plus/security/scope-contract.template.yml`
- `sdd-plus/security/product-inventory.template.yml`
- `sdd-plus/security/data-inventory.template.yml`
- `sdd-plus/security/threat-model.template.md`
- `sdd-plus/security/auth-role-matrix.template.yml`
- `sdd-plus/security/dependency-policy.template.yml`
- `sdd-plus/security/accepted-risks.template.md`
- `sdd-plus/security/launch-decision.template.md`

Projects may copy templates to non-template filenames when creating real launch records.

## Gate Model

LGF uses gates to decide which checks must be completed before launch.

Canonical LGF gates:

| Gate | Purpose |
| --- | --- |
| Scope & Permission | Confirm what is being launched, who approved the review scope, and what is intentionally out of scope. |
| Product, Asset & Data Inventory | Record components, exposed surfaces, assets, data classes, owners, and trust boundaries. |
| Threat Modeling | Identify likely threats, abuse paths, mitigations, residual risk, and launch blockers. |
| Code Security | Review security-sensitive code paths, unsafe patterns, privilege boundaries, and implementation evidence. |
| Secrets & Config Hygiene | Confirm secrets, tokens, keys, credentials, and environment configuration are handled safely. |
| Frontend Exposure | Review public routes, browser storage, client-side secrets, CORS, CSP, and user-controlled rendering. |
| API Auth & Object Authorization | Confirm API authentication, object-level authorization, tenant boundaries, and permission checks. |
| Injection & Input Safety | Review input validation, output encoding, query construction, command execution, and parser safety. |
| Auth, Sessions & CSRF | Review login, signup, password reset, session lifecycle, cookies, MFA, CSRF, and logout behavior. |
| File Upload, SSRF, Imports & Exports | Review file handling, remote fetches, import/export formats, SSRF controls, and content processing. |
| Dependency, SBOM & Supply Chain | Review dependency policy, lockfiles, vulnerability thresholds, package sources, and SBOM expectations. |
| Infrastructure, DNS, TLS & Web Hardening | Review hosting, DNS, TLS, headers, network exposure, environment separation, and web hardening. |
| Resilience, DDoS, Abuse & Cost Defense | Review rate limits, quotas, retries, abuse paths, cost controls, and degradation behavior. |
| Webhooks, Background Jobs & Integrations | Review webhook verification, job idempotency, retries, third-party integrations, and failure handling. |
| Privacy, Legal & Data Lifecycle | Review personal data, notice/consent, retention, deletion, legal constraints, and data sharing. |
| AI/RAG/Agent Security | Review prompt injection, tool permissions, retrieval boundaries, model data exposure, and agent actions. |
| Multi-Tenant & Internal Permission Isolation | Review tenant isolation, internal roles, admin access, scoped permissions, and cross-account access. |
| Observability, Logs & Incident Readiness | Review logging, monitoring, alerting, sensitive log data, incident paths, and ownership. |
| Backup, Recovery, Deletion & Rotation | Review backups, restore tests, deletion paths, credential rotation, and recovery objectives. |
| Business Logic Abuse | Review workflow abuse, fraud paths, privilege escalation through product logic, and bypasses. |
| Launch Decision | Record findings, accepted risks, skipped gates, rollback plan, and final human approval. |
| Continuous Monitoring | Record post-launch monitoring, review cadence, recurring checks, and ownership. |

Codex or another agent may propose which gates apply. A human must confirm skipped high-risk gates before launch.

## Severity Model

Use severity to decide whether launch can proceed:

- Critical: blocks launch until fixed or removed from scope. Critical findings cannot be accepted as routine launch risks.
- High: should block launch unless a human owner explicitly accepts the risk with a time-bound mitigation plan.
- Medium: may launch with owner, mitigation, and follow-up date.
- Low: may launch with tracking or documentation.

Critical findings block launch.

## High-Impact Changes

Treat these areas as high-impact:

- security controls or security assumptions
- authentication, authorization, sessions, identity, or permissions
- privacy, personal data, sensitive data, production data, or retention
- deployment, hosting, domains, networking, secrets, or environment configuration
- database schema, migrations, storage, backups, or destructive data operations
- frontend exposure, client-side tokens, public routes, CORS, CSP, or browser storage
- infrastructure, CI/CD, dependency policy, or supply-chain controls

High-impact changes should update LGF artifacts or explain why no LGF update is needed.

## SDD+ Integration

For each active SDD+ change:

1. Decide whether the change is deployable or high-impact.
2. If LGF applies, update or create the relevant LGF artifacts.
3. Record applied and skipped gates in the change packet.
4. Record decisions, accepted risks, and evidence.
5. Do not mark the change complete if a critical finding remains open.

LGF records are part of durable project memory. Do not rely on chat history for launch-critical decisions.
