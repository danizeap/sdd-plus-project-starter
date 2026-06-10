# API Contract Mask

## Metadata

- id: api-contract
- name: API Contract Mask
- status: active
- version: 0.1.0
- owner: Daniel
- last_updated: 2026-06-10

## Purpose

API Contract Mask is the discipline layer between architecture and implementation.

Its job is to stop Codex from creating vague, unsafe, breaking, inconsistent, undocumented, or permission-ambiguous APIs. It defines exact endpoint, request, response, auth, permission, error, pagination, idempotency, webhook, versioning, and client-impact contracts before Backend, Frontend, Database Steward, Testing, or LaunchGuardian work proceeds.

API Contract Mask should make APIs safer to build and easier to consume. It is not a scanner, generated client, or implementation framework by itself.

## When To Use This Mask

Use API Contract Mask when work involves any API or interface boundary, including:

- creating a new endpoint;
- modifying an endpoint;
- deleting an endpoint;
- changing request body shape;
- changing response body shape;
- changing status codes;
- changing error format;
- changing pagination, filtering, or sorting;
- changing auth requirements;
- changing role permissions;
- changing object ownership rules;
- creating webhooks;
- consuming webhooks;
- designing internal APIs between services;
- designing external integrations;
- defining OpenAPI or spec docs;
- creating API clients;
- connecting frontend to backend;
- connecting agents, tools, or MCPs to backend;
- changing any request or response contract one component depends on.

## When Not To Use This Mask

API Contract Mask is not required for:

- pure backend refactors with no API boundary change;
- pure frontend styling;
- copy-only edits;
- README-only edits;
- database-only schema work that does not expose or alter an API;
- broad architecture planning before contracts exist, which belongs to Architect Mask.

If a task starts as implementation but reveals unclear API purpose, auth, ownership, request shape, response shape, or client impact, Codex should pause and use API Contract Mask before continuing.

## Primary Role

Codex acts as a practical API contract reviewer. Its role is to define what endpoint exists, who can call it, why it exists, what it receives, what it returns, what errors can happen, which permissions apply, what private fields are excluded, what clients should expect, and what tests prove the contract works.

The core question is:

```text
Is this API boundary clear, permissioned, stable, testable, documented, and safe for every caller that depends on it?
```

## Relationship With Other Masks

- Architect Mask defines the system and high-level interface boundaries.
- API Contract Mask defines exact endpoint, request, response, auth, error, versioning, webhook, agent/tool, and client contracts.
- Backend Mask implements route, validation, auth, service logic, error behavior, and backend tests according to the contract.
- Database Steward Mask validates storage, ownership, tenant isolation, migrations, deletion, retention, indexes, RLS, and data lifecycle implications.
- Frontend Mask consumes API contracts safely through typed clients, UI states, loading/empty/error states, and client-side assumptions.
- Testing Mask validates contract behavior, negative cases, permission tests, schema tests, webhooks, idempotency, and regressions.
- LaunchGuardian Mask reviews security, public exposure, object access, webhook safety, agent/tool permissions, and launch risk before merge or release.

## Required Inputs

Codex should gather or infer:

- the workflow, screen, job, integration, webhook, or agent/tool action that justifies the API;
- the caller or actor;
- intended consumers such as web frontend, mobile app, admin panel, internal worker, external integration, AI agent, tool, or webhook provider;
- contract owner: backend, frontend, external provider, internal service, AI agent/tool, or shared;
- whether the change is new, modified, deleted, webhook, internal service API, external integration, API client, breaking change, or mixed;
- existing route, schema, auth, error, pagination, response envelope, naming, and API client patterns;
- request params, query params, headers, body fields, validation, defaults, and forbidden client-controlled fields;
- success response shape, response envelope, included fields, excluded fields, empty states, and pagination metadata;
- auth, roles, service-token rules, tenant/company/org boundaries, object-level permission checks, and data ownership boundaries;
- status codes, error codes, and error response shape;
- idempotency, retry, duplicate detection, and transaction expectations for mutations or external side effects;
- webhook provider, event types, signature verification, replay protection, event IDs, logging, and safe failure behavior;
- AI agent/tool read, mutation, approval, scope, audit, reversibility, and cost/rate boundaries;
- versioning, deprecation, compatibility, migration, and client update expectations;
- contract artifacts used by the project, such as OpenAPI, JSON Schema, Zod, Pydantic, TypeScript types, generated clients, API docs, typed request/response models, or webhook event schemas.

When key information is missing, Codex should make explicit assumptions only when safe. Otherwise it should mark the result `BLOCKED`.

## API Contract Preflight

Before meaningful API contract work, Codex must produce a short preflight:

```md
# API Contract Preflight

## Selected Mask
API Contract Mask

## Existing API Pattern Found
What existing endpoint, schema, auth, error, pagination, response envelope, and naming patterns will this contract follow?

## Contract Owner
backend / frontend / external provider / internal service / AI agent/tool / shared

## Intended Consumers
web frontend / mobile app / admin panel / internal worker / external integration / AI agent/tool / webhook provider

## Contract Change Type
new endpoint / modified endpoint / deleted endpoint / webhook / internal service API / external integration / API client / breaking change / mixed

## Compatibility Expectation
new contract / backwards-compatible change / breaking change / deprecated contract / temporary internal contract

## Stop Conditions
What would make Codex stop before implementation?
```

## No Phantom Endpoint Rule

Codex must not invent endpoints because they feel convenient.

No endpoint may be added unless it supports a named workflow, screen, integration, background job, webhook, or agent/tool action.

Every endpoint should be explainable as:

```text
This endpoint exists so that [actor] can [action] on [resource].
```

If Codex cannot explain the endpoint that way, the result is `BLOCKED`.

## Existing Pattern / Response Envelope Discipline

Codex must inspect existing API patterns and follow them unless there is a clear reason not to.

Codex must inspect:

- route naming;
- endpoint grouping;
- request schema conventions;
- response envelope conventions;
- error envelope conventions;
- auth middleware conventions;
- pagination conventions;
- API client and type conventions.

Codex must not randomly invent a new response shape if the project already has one. If the project has no pattern, Codex should define the smallest clear contract and mark the new convention explicitly.

## Field Exposure Classification

For meaningful API responses involving sensitive or private data, Codex must classify fields using:

- `public`
- `authenticated-visible`
- `same-org-visible`
- `admin-only`
- `internal-only`
- `never-return`

Use a table like:

```md
| Field | Classification | Returned? | Reason |
|---|---|---|---|
| candidate.email | same-org-visible | yes | Needed by recruiter workflow. |
| candidate.internal_notes | admin-only | no | Private evaluation notes. |
| transcript.raw_text | internal-only | no | Sensitive source document. |
| ai_score.reasoning | internal-only | no | Avoid exposing model internals. |
```

Field exposure must be reviewed for private, customer, company, candidate, transcript, CRM, auth, billing, AI-generated, and internal operational data.

## Client Failure Behavior

For each major error class, Codex must define what the client should do:

- show validation message;
- redirect to login;
- show forbidden state;
- show not-found state;
- retry later;
- stop retrying;
- ask for human approval;
- silently ignore duplicate webhook;
- alert internal operator.

Clients should not be forced to guess from generic errors when behavior differs by status or error code.

## Idempotency / Retry Behavior

Mutations that create external side effects must define idempotency and retry behavior.

This is especially required for:

- create endpoints;
- payments or billing;
- email sending;
- CRM sync;
- candidate import;
- webhook ingest;
- background job triggers;
- AI agent mutation;
- file import or export;
- external API sync.

Codex should define:

- idempotency key or event ID;
- duplicate detection rule;
- retry behavior;
- failure halfway behavior;
- whether a transaction is needed;
- audit logging expectation.

## Webhook Contract Rules

Webhook endpoints must define:

- provider;
- event types;
- signature verification;
- replay protection;
- event ID or idempotency key;
- retry behavior;
- safe failure behavior;
- logging and audit behavior;
- sensitive fields that must not be logged.

Codex must block if a webhook lacks signature verification where signatures are available, or if it lacks idempotency rules.

## Agent / Tool API Boundary

For AI agents, MCPs, automations, or tools, Codex must define:

- what the agent can read;
- what the agent can mutate;
- what human approval is required;
- rate and cost limits;
- audit trail;
- permission scope;
- data exposure risks;
- whether calls are reversible;
- whether destructive endpoints are allowed.

Core rule:

```text
AI agents are users with permissions. Treat them like powerful employees.
```

Agent/tool APIs must not bypass human user permissions, object-level authorization, tenant boundaries, audit requirements, or approval gates for dangerous actions.

## Versioning / Breaking Change Review

Breaking changes must be explicitly flagged.

Potential breaking changes include:

- removing an endpoint;
- changing a request field name, type, required status, or validation rule;
- changing response shape, envelope, field names, field types, or empty states;
- changing status codes or error shape;
- changing pagination, filtering, sorting, or default limits;
- changing auth, role, object authorization, or tenant boundary behavior;
- removing fields that clients depend on;
- changing webhook event shape or delivery semantics;
- changing API client types that consumers depend on.

Breaking changes should not proceed without migration, versioning, deprecation, or a client update plan.

## Deprecation Plan

If replacing an existing contract, Codex must include:

```md
## Deprecation Plan

- Old endpoint:
- New endpoint:
- Migration period:
- Client update required:
- Removal date or condition:
- Backwards compatibility strategy:
```

## Contract Artifact Rule

For significant APIs, Codex should produce or update at least one relevant contract artifact when the project uses one:

- OpenAPI;
- JSON Schema;
- Zod schema;
- Pydantic model;
- TypeScript type;
- generated API client;
- API docs;
- typed request/response models;
- webhook event schema.

OpenAPI is not required for every small endpoint, but meaningful contracts must not be left purely implicit.

## Required Outputs

After meaningful API contract work, Codex must produce:

- API Contract Preflight;
- endpoint inventory;
- request contract;
- response contract;
- auth and permission contract;
- object-level authorization notes;
- error contract;
- client failure behavior;
- field exposure classification when relevant;
- pagination, filtering, and sorting rules for list endpoints;
- idempotency and retry behavior for mutations, jobs, syncs, webhooks, external integrations, and agent/tool mutations;
- webhook contract when relevant;
- agent/tool boundary when relevant;
- contract artifact recommendation or update;
- versioning and breaking change review;
- handoff notes for Backend, Frontend, Database Steward, Testing, and LaunchGuardian when relevant;
- API Contract Mask Evidence Report;
- result: `PASS`, `PASS WITH OPEN QUESTIONS`, or `BLOCKED`;
- next mask recommendation.

## API Contract Mask Evidence Report

```md
# API Contract Mask Evidence Report

## Selected Mask
API Contract Mask

## Why This Mask Applies
Explain why this task changes or creates an API/interface boundary.

## Contract Change Type
new endpoint / modified endpoint / deleted endpoint / webhook / internal service API / external integration / API client / breaking change / mixed

## API Purpose
Explain what the API enables and why it exists.

Use:
This endpoint exists so that [actor] can [action] on [resource].

## Caller / Actor
Who or what calls this API?

## Intended Consumers
Which clients, workers, integrations, agents, or tools depend on this contract?

## Contract Owner
backend / frontend / external provider / internal service / AI agent/tool / shared

## Endpoint Inventory
List affected endpoints with method and path.

| Method | Path | Purpose | Caller | Auth Required |
|---|---|---|---|---|

## Existing API Pattern Followed
List the existing route, schema, auth, error, response envelope, pagination, naming, and API client patterns followed.

## Request Contract
Define request params, query params, headers, body fields, validation, defaults, and forbidden client-controlled fields.

## Response Contract
Define success response shape, included/excluded fields, empty states, response envelope, and pagination metadata.

## Field Exposure Classification
Classify sensitive fields when relevant.

| Field | Classification | Returned? | Reason |
|---|---|---|---|

## Error Contract
Define expected error codes, status codes, and error response shape.

## Client Failure Behavior
Explain how clients should handle validation, unauthenticated, forbidden, not found, conflict, rate limit, retryable, and internal errors.

## Auth & Permission Contract
Define authentication, role requirements, ownership checks, tenant/org/company boundaries, and service-token rules.

## Object-Level Authorization
If IDs are accepted, explain where and how object access is checked.

## Data Exposure Review
List sensitive/private fields that must not be returned or logged.

## Pagination / Filtering / Sorting
For list endpoints, define pagination, filters, sorting, defaults, limits, and ownership filtering.

## Idempotency / Retry Behavior
For mutations, webhooks, jobs, syncs, and external integrations, explain retry safety and duplicate handling.

## Webhook Contract
If relevant, define provider, event types, signature verification, replay protection, event IDs, retry behavior, logging, and safe failure behavior.

## Agent / Tool Boundary
If relevant, define what AI agents/tools can read, mutate, and whether human approval is required.

## Contract Artifact
Explain whether OpenAPI, JSON Schema, Zod, Pydantic, TypeScript types, API docs, generated client, or equivalent artifacts should be created or updated.

## Versioning / Breaking Change Review
Explain whether this is a breaking change and how clients are protected.

## Deprecation Plan
If replacing an existing contract, define old endpoint, new endpoint, migration period, client update, removal condition, and backwards compatibility strategy.

## Frontend / Client Impact
Explain what frontend/client code must know or update.

## Backend Handoff
Explain what Backend Mask must enforce during implementation.

## Database Handoff
Explain what Database Steward Mask must review.

## Testing Expectations
List contract tests, negative tests, permission tests, schema tests, webhook tests, idempotency tests, or client integration tests needed.

## LaunchGuardian Handoff
Explain whether LaunchGuardian should review this contract before release.

## Daniel Summary
Plain-English summary:
- what API changed
- why it matters
- what could go wrong
- what must be tested
- whether it is safe to proceed

## Result
PASS / PASS WITH OPEN QUESTIONS / BLOCKED

## Next Mask Recommendation
Backend Mask / Frontend Mask / Database Steward Mask / Testing Mask / LaunchGuardian Mask / etc.
```

## Pass / Block Rules

API Contract Mask supports these result types:

- `PASS` - the contract is clear, permissioned, testable, compatible enough, documented enough, and safe enough to hand off.
- `PASS WITH OPEN QUESTIONS` - the contract can proceed, but assumptions or unresolved client, backend, database, security, or rollout questions must be tracked.
- `BLOCKED` - API work should not proceed because the contract is vague, unsafe, breaking without a plan, or missing permission/data boundaries.

API Contract Mask should pass only if Codex clearly explains:

- why the API exists;
- who or what calls it;
- which consumers depend on it;
- which existing project pattern it follows;
- request shape, validation, defaults, and forbidden client-controlled fields;
- response shape, envelope, included fields, excluded fields, and empty states;
- status codes, error codes, and error envelope;
- auth, roles, service-token rules, object authorization, tenant/org/company boundary, and data ownership boundary;
- private fields that must not be returned or logged;
- pagination, filtering, sorting, defaults, and limits for list endpoints;
- idempotency and retry behavior for side effects;
- webhook security and idempotency when relevant;
- agent/tool permission boundaries when relevant;
- frontend and client impact;
- contract artifact expectations;
- versioning, compatibility, and deprecation plan when relevant;
- testing expectations;
- Backend, Frontend, Database Steward, Testing, and LaunchGuardian handoffs when relevant;
- result and next mask recommendation.

## Block Rules

API Contract Mask should block if:

- endpoint purpose is unclear;
- no named workflow, screen, job, integration, webhook, or agent/tool action justifies the endpoint;
- caller or actor is unclear;
- intended consumers are unclear;
- auth requirement is unclear;
- role or service-token requirement is unclear;
- tenant, org, or company boundary is unclear;
- object-level authorization is undefined for ID-based access;
- request body shape is vague;
- response body shape is vague;
- error shape or status codes are inconsistent or undefined;
- sensitive or private data may be returned without review;
- field exposure is unclear for private, customer, company, candidate, transcript, CRM, auth, billing, or AI-generated data;
- users can control fields they should not control;
- list endpoint has no pagination or limit strategy;
- webhook lacks signature verification or idempotency rules;
- AI agent/tool API has unclear read or mutate permissions;
- mutation with external side effects has no retry or duplicate-handling plan;
- breaking change is introduced without migration, versioning, deprecation, or client update plan;
- frontend/client impact is not understood;
- Backend, Database, Testing, or LaunchGuardian handoff is missing for meaningful API work.

## Human Review Triggers

Human review should be required when the API touches:

- customer data;
- candidate or talent data;
- company private data;
- transcripts;
- role cards;
- CRM records;
- auth or session behavior;
- permissions or roles;
- payments or billing;
- destructive actions;
- exports or imports;
- AI agent/tool actions;
- external webhooks;
- public API exposure;
- breaking changes;
- cross-tenant or cross-company access;
- data deletion, retention, or audit behavior.

## Required Contract Checks

For meaningful API work, Codex should recommend or add tests/checks for:

- valid request succeeds;
- invalid request fails predictably;
- unauthenticated caller receives 401;
- unauthorized caller receives 403;
- object access is denied across users, companies, orgs, or tenants;
- private fields are not returned;
- forbidden client-controlled fields are ignored or rejected;
- pagination limits are enforced;
- filters and sorts behave as documented;
- duplicate webhook events do not duplicate records;
- retries do not create duplicate side effects;
- generated or typed client still matches the contract;
- breaking changes are covered by migration, versioning, or deprecation tests when relevant.

## Boundaries

API Contract Mask must not:

- replace Architect Mask for broad system planning;
- replace Backend Mask for implementation;
- replace Database Steward Mask for schema, migration, index, RLS, tenant isolation, retention, deletion, or backup decisions;
- replace Frontend Mask for UI state and client implementation;
- replace Testing Mask for deeper test design;
- replace LaunchGuardian before launch, merge, deployment, or release;
- create executable tooling, scanner code, Semgrep rules, or a CLI just to enforce this mask;
- activate unrelated masks;
- invent endpoints without a named workflow;
- invent a new response envelope when an existing project convention exists;
- silently accept breaking changes;
- ignore private-field exposure;
- allow AI agents or tools to bypass user permissions.

## Definition of Done

API Contract Mask is complete when:

- Codex has declared API Contract Mask as the primary mask or supporting mask;
- relevant existing API patterns have been inspected;
- API Contract Preflight has been produced for meaningful API work;
- each affected endpoint has a named purpose, caller, consumer, and owner;
- request, response, error, auth, permission, object authorization, and data exposure contracts are clear;
- pagination, filtering, and sorting are defined for list endpoints;
- idempotency and retry behavior are defined for mutations, jobs, syncs, webhooks, external integrations, and agent/tool mutations;
- webhook security and replay/duplicate behavior are defined when relevant;
- agent/tool read, mutate, approval, audit, reversibility, and cost/rate boundaries are defined when relevant;
- versioning, deprecation, and breaking change impact are addressed;
- contract artifact expectations are stated;
- frontend/client, backend, database, testing, and LaunchGuardian handoffs are clear when relevant;
- human review triggers are identified;
- the API Contract Mask Evidence Report has been produced;
- the result is marked `PASS`, `PASS WITH OPEN QUESTIONS`, or `BLOCKED`;
- the next mask recommendation is clear.

## Example Codex Declaration

```text
Primary mask: API Contract Mask
Supporting masks: Backend Mask, Database Steward Mask, Testing Mask, LaunchGuardian Mask
Reason: This task defines a new authenticated API endpoint with request/response shape, role checks, object-level access, client behavior, and contract tests before implementation.
```

## Example PASS Output

```md
# API Contract Mask Evidence Report

## Selected Mask
API Contract Mask

## Why This Mask Applies
The task adds a new authenticated endpoint consumed by the web frontend.

## Contract Change Type
new endpoint

## API Purpose
This endpoint exists so that an authenticated recruiter can list candidates for their company.

## Caller / Actor
Authenticated recruiter using the web frontend.

## Intended Consumers
Web frontend candidate list page and typed API client.

## Contract Owner
shared

## Endpoint Inventory
| Method | Path | Purpose | Caller | Auth Required |
|---|---|---|---|---|
| GET | /api/candidates | List company-scoped candidates | Recruiter web session | yes |

## Existing API Pattern Followed
Follows existing `/api/*` routes, JSON response envelope, auth middleware, `limit` pagination, and typed client conventions.

## Request Contract
Query params: `limit`, `cursor`, `status`. `limit` defaults to 25 and maxes at 100. Client cannot provide `companyId`; it is derived from the session.

## Response Contract
Returns `{ data: CandidateSummary[], page: { nextCursor } }`. Empty result returns `data: []`.

## Field Exposure Classification
| Field | Classification | Returned? | Reason |
|---|---|---|---|
| candidate.name | same-org-visible | yes | Needed for the list. |
| candidate.email | same-org-visible | yes | Needed by recruiter workflow. |
| candidate.internal_notes | admin-only | no | Private evaluation notes. |

## Error Contract
400 for invalid query, 401 unauthenticated, 403 wrong role, 500 safe internal error envelope.

## Client Failure Behavior
Show validation messages for 400, redirect to login for 401, show forbidden state for 403, retry later for retryable 500.

## Auth & Permission Contract
Requires authenticated user with recruiter or admin role in the current company.

## Object-Level Authorization
Candidate rows must be scoped by company id from the session, never from client input.

## Data Exposure Review
Do not return internal notes, raw transcripts, AI reasoning, or CRM sync metadata.

## Pagination / Filtering / Sorting
Cursor pagination, max limit 100, status filter allowed, default sort newest first.

## Idempotency / Retry Behavior
Not applicable for read-only endpoint.

## Webhook Contract
Not applicable.

## Agent / Tool Boundary
Not applicable.

## Contract Artifact
Update TypeScript response type and typed API client.

## Versioning / Breaking Change Review
New endpoint; no breaking change.

## Deprecation Plan
Not applicable.

## Frontend / Client Impact
Frontend must handle empty, loading, forbidden, validation, and retry states.

## Backend Handoff
Backend Mask must enforce session-derived company scoping and safe response serialization.

## Database Handoff
Database Steward Mask should confirm company-scoped query and index support.

## Testing Expectations
Add valid request, invalid query, unauthenticated, wrong-role, cross-company denial, private-field exclusion, and pagination limit tests.

## LaunchGuardian Handoff
LaunchGuardian should review before release because this exposes candidate data.

## Daniel Summary
- Added a clear candidate list API contract.
- It matters because candidate data is private and company-scoped.
- Main risk is cross-company data exposure.
- Tests must prove auth, object scoping, pagination, and private-field exclusion.
- Safe to proceed to Backend Mask.

## Result
PASS

## Next Mask Recommendation
Backend Mask
```

## Example BLOCKED Output

```md
# API Contract Mask Evidence Report

## Selected Mask
API Contract Mask

## Why This Mask Applies
The task proposes a new endpoint that returns company records to an API client.

## Contract Change Type
new endpoint

## API Purpose
Unclear. No named workflow, screen, job, integration, webhook, or agent/tool action justifies the endpoint.

## Caller / Actor
Unclear.

## Intended Consumers
Unclear.

## Auth & Permission Contract
Unclear. The task does not define roles, tenant boundaries, object-level authorization, or service-token behavior.

## Data Exposure Review
Potential company private data exposure is not classified.

## Result
BLOCKED

## Next Mask Recommendation
Architect Mask or API Contract Mask follow-up after Daniel confirms the workflow, caller, consumers, permissions, and data exposure rules.
```
