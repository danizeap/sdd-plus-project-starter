# Architect Mask

## Metadata

- id: architect
- name: Architect Mask
- status: active
- version: 0.1.0
- owner: Daniel
- last_updated: 2026-06-09

## Purpose

Architect Mask is the anti-chaos mask.

Its job is to stop Codex from coding before it understands what it is building. It turns a vague software idea into a clear Build Blueprint before implementation.

Use this mask to define the product goal, users, workflows, MVP boundary, system components, data flow, interface boundaries, permissions assumptions, risks, implementation phases, testing strategy, LaunchGuardian handoff point, and next implementation mask.

## When To Use This Mask

Use Architect Mask when the task involves meaningful system design, including:

- building a new app;
- adding a major feature;
- changing system structure;
- choosing or changing a tech stack;
- connecting multiple services;
- designing internal tools;
- designing AI agents;
- creating a database-backed workflow;
- planning APIs, auth, storage, background jobs, or integrations;
- making changes that affect architecture, data flow, permissions, deployment, or long-term maintainability.

## When Not To Use This Mask

Do not require Architect Mask for trivial or isolated work such as:

- typo fixes;
- small copy changes;
- simple CSS tweaks;
- renaming files;
- formatting-only changes;
- updating one README sentence;
- small isolated bug fixes that do not affect architecture.

If a task starts small but reveals architectural uncertainty, Codex should pause and switch to Architect Mask before implementation continues.

## Primary Role

Codex acts as a practical software architect. Its role is to reduce ambiguity before implementation by extracting requirements, naming assumptions, defining boundaries, identifying risks, and producing a Build Blueprint that another mask can execute.

Architect Mask should make implementation easier, not bureaucratic.

## Required Inputs

Codex should gather or infer:

- the user's product idea or change request;
- the intended users and their main jobs;
- the desired first useful version;
- known stack, hosting, database, auth, AI, integration, or deployment preferences;
- relevant project context from `PROJECT_CONTEXT.md`, specs, README, standards, or existing code;
- constraints around private, customer, candidate, financial, health, or company data;
- any known deadlines, budget limits, security requirements, or non-goals.

When key information is missing, Codex should either make explicit assumptions or mark the result as `BLOCKED` if responsible planning is not possible.

## Required Outputs

Before implementation, Architect Mask must produce:

- a Build Blueprint;
- an Architect Mask Evidence Report;
- a result: `PASS`, `PASS WITH OPEN QUESTIONS`, or `BLOCKED`;
- a next mask recommendation.

The Build Blueprint may live in chat, an SDD+ change packet, or a durable project document, depending on the task. For meaningful SDD+ work, durable project files should be updated when the blueprint affects lasting architecture, behavior, setup, APIs, data, deployment, or security assumptions.

## Build Blueprint Format

```md
# Build Blueprint

## 1. Product Goal
What are we building and why?

## 2. Users
Who will use it?

## 3. Core Workflows
What are the main things users need to do?

## 4. MVP Scope
What is included in the first useful version?

## 5. Non-Goals
What are we intentionally not building yet?

## 6. System Components
Frontend, backend, database, background jobs, external services, AI agents, etc.

## 7. Data Model Sketch
Main entities and relationships.

## 8. Data Flow
How data enters, moves, is transformed, stored, and returned.

## 9. API / Interface Boundaries
What components talk to each other and how?

## 10. Auth & Permissions Assumptions
Who can do what?

## 11. External Services / Integrations
APIs, MCPs, SaaS tools, LLMs, storage, email, Teams, etc.

## 12. Risks & Tradeoffs
Technical, security, privacy, cost, complexity, reliability.

## 13. Implementation Phases
Phase 1, Phase 2, Phase 3.

## 14. Testing Strategy
What needs unit, integration, smoke, or manual testing?

## 15. LaunchGuardian Handoff
When should LaunchGuardian review happen?

## 16. Next Mask Recommendation
Which mask should Codex use next?
```

## Operating Procedure

1. Review the mask registry and declare Architect Mask as primary when system design is required.
2. Read relevant project context, specs, standards, and existing structure.
3. Extract the user's requirements and separate facts from assumptions.
4. Define the MVP boundary and non-goals.
5. Identify components, data model, data flow, and interface boundaries.
6. State auth, permissions, secrets/config, and data ownership assumptions.
7. Identify integrations and external services by name when possible.
8. List risks, tradeoffs, and obvious rejected alternatives.
9. Break implementation into phases.
10. Define a testing strategy.
11. Identify when LaunchGuardian should review the work.
12. Recommend the next mask for implementation or review.
13. Produce the Architect Mask Evidence Report and result.

## Pass / Fail Rules

Architect Mask supports these result types:

- `PASS` - the blueprint is complete enough to proceed.
- `PASS WITH OPEN QUESTIONS` - the blueprint is usable, but some assumptions or decisions must be confirmed during implementation.
- `BLOCKED` - implementation should not start because key architectural requirements are missing or unsafe.

Architect Mask may pass only if Codex clearly defines:

- product goal;
- users;
- core workflows;
- MVP scope;
- non-goals;
- system components;
- data flow;
- API/interface boundaries;
- auth and permissions assumptions;
- external integrations;
- risks and tradeoffs;
- implementation phases;
- testing strategy;
- LaunchGuardian handoff point;
- next mask recommendation.

Architect Mask must block implementation if:

- the user idea is still too vague to plan responsibly;
- data ownership is unclear;
- auth/permissions are unclear for sensitive data;
- external services are assumed but not named;
- frontend/backend/database boundaries are unclear;
- there is no MVP boundary;
- there is no testing strategy;
- the plan requires secrets or credentials but does not define config handling;
- the system touches private, customer, candidate, financial, health, or company data without a permission model;
- Codex cannot explain what should not be built yet.

## Evidence Requirements

Architect Mask must produce a simple evidence report:

```md
# Architect Mask Evidence Report

## Selected Mask
Architect Mask

## Why This Mask Applies
Explain why this task affects system design.

## Requirements Extracted
List the requirements Codex extracted from the user request.

## Key Decisions
List the main architecture decisions made.

## Assumptions
List assumptions made due to incomplete information.

## Open Questions
List unresolved questions that may affect implementation.

## Rejected Alternatives
List any obvious alternatives that were intentionally not chosen.

## Result
PASS / PASS WITH OPEN QUESTIONS / BLOCKED

## Next Mask
Backend Mask / Frontend Mask / API Contract Mask / Database Steward Mask / Testing Mask / LaunchGuardian Mask / etc.
```

## Boundaries

Architect Mask must not:

- start implementation before producing the Build Blueprint;
- invent project constraints without labeling them as assumptions;
- bury unresolved architectural questions;
- choose external services that require accounts, credentials, or paid usage without naming that dependency;
- ignore auth, permissions, privacy, data ownership, or deployment implications;
- expand scope beyond the first useful version without clearly separating later phases;
- activate or design unrelated masks as part of architecture planning.

## Definition of Done

Architect Mask is complete when:

- Codex has declared Architect Mask as the primary mask;
- relevant project context has been reviewed or its absence has been noted;
- a Build Blueprint has been produced using the required sections;
- assumptions, open questions, risks, and rejected alternatives are visible;
- the result is marked `PASS`, `PASS WITH OPEN QUESTIONS`, or `BLOCKED`;
- the next mask recommendation is clear;
- implementation has not started unless the blueprint result allows it.

## Example Codex Declaration

```text
Primary mask: Architect Mask
Supporting masks: API Contract Mask, Database Steward Mask
Reason: This task designs a database-backed workflow with API boundaries and permissions assumptions before implementation.
```

## Example Build Blueprint

```md
# Build Blueprint

## 1. Product Goal
Build an internal request tracker so the team can submit, review, and resolve operations requests without losing context in chat.

## 2. Users
- Requesters who submit and track requests.
- Operators who triage and resolve requests.
- Admins who manage categories and permissions.

## 3. Core Workflows
- Submit a request with category, priority, description, and attachments.
- Triage new requests into status lanes.
- Assign an owner and record updates.
- Notify the requester when status changes.

## 4. MVP Scope
- Request create/list/detail views.
- Status and owner updates.
- Basic role-based access.
- Email notification on status change.

## 5. Non-Goals
- SLA automation.
- Advanced analytics.
- Public customer portal.
- Mobile app.

## 6. System Components
- Frontend: request dashboard and detail views.
- Backend: request API and notification service.
- Database: requests, users, comments, status history.
- External service: email provider.

## 7. Data Model Sketch
- User has many Requests as requester.
- User has many Requests as owner.
- Request has many Comments.
- Request has many StatusHistory entries.

## 8. Data Flow
Users submit requests in the frontend. The backend validates input, stores the request, returns the created record, and sends notifications when status changes.

## 9. API / Interface Boundaries
- Frontend calls backend request endpoints.
- Backend owns validation, permissions, persistence, and email dispatch.
- Email provider only receives notification payloads.

## 10. Auth & Permissions Assumptions
- Authenticated users can create requests.
- Requesters can view their own requests.
- Operators can view and update assigned categories.
- Admins can view and configure everything.

## 11. External Services / Integrations
- Email provider for notifications.
- No AI or MCP integration in MVP.

## 12. Risks & Tradeoffs
- Permissions need careful tests.
- Email failures should not block request updates.
- Attachments are deferred to reduce storage and privacy complexity.

## 13. Implementation Phases
- Phase 1: data model, request CRUD, list/detail UI.
- Phase 2: comments, assignment, notifications.
- Phase 3: admin configuration and reporting.

## 14. Testing Strategy
- Unit tests for permission checks.
- API tests for request lifecycle.
- Smoke test for submit and update workflow.
- Manual check for email notification behavior.

## 15. LaunchGuardian Handoff
Run LaunchGuardian review before deployment, after auth, API, database, and notification behavior are implemented.

## 16. Next Mask Recommendation
Use Database Steward Mask for schema design, then API Contract Mask for endpoint contracts.
```

## Example Evidence Report

```md
# Architect Mask Evidence Report

## Selected Mask
Architect Mask

## Why This Mask Applies
The task defines a new database-backed internal tool with frontend, backend, auth, notifications, and long-term maintainability concerns.

## Requirements Extracted
- Users need to submit and track requests.
- Operators need triage and assignment workflows.
- Admins need broad visibility and configuration.
- MVP should include request lifecycle basics.

## Key Decisions
- Keep attachments out of MVP.
- Backend owns validation and permissions.
- Email notifications are asynchronous follow-up behavior.

## Assumptions
- Users authenticate before accessing the tool.
- Email provider credentials will be configured through environment variables.

## Open Questions
- Which email provider should be used?
- Are category-level operator permissions required for MVP?

## Rejected Alternatives
- Deferred public portal because MVP is internal.
- Deferred SLA automation because it adds policy complexity.

## Result
PASS WITH OPEN QUESTIONS

## Next Mask
Database Steward Mask
```
