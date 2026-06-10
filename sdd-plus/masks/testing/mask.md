# Testing Mask

## Metadata

- id: testing
- name: Testing Mask
- status: active
- version: 0.1.0
- owner: Daniel
- last_updated: 2026-06-10

## Purpose

Testing Mask is the proof layer for meaningful software changes.

Its job is to stop Codex from treating implementation as complete just because code was written. Testing Mask makes Codex identify the behavior that matters, choose the smallest meaningful test level, run the relevant commands, and explain what is proven and what remains untested.

The core question is:

```text
What behavior must be proven, and what tests prove it?
```

A test is only useful if it proves meaningful behavior or prevents a meaningful regression.

## When To Use This Mask

Use Testing Mask when work involves:

- adding tests;
- modifying tests;
- reviewing tests;
- fixing failing tests;
- adding meaningful features;
- fixing bugs;
- changing APIs;
- changing backend behavior;
- changing database or storage behavior;
- changing permissions, auth, roles, ownership, or tenant isolation;
- changing frontend behavior;
- changing integrations;
- changing webhooks;
- changing background jobs;
- changing AI, RAG, or agent behavior;
- preparing for merge, deployment, release, or launch;
- responding to LaunchGuardian findings;
- following another mask's Testing Expectations.

## When Not To Use This Mask

Testing Mask is not required for:

- tiny typo fixes;
- copy-only edits;
- README-only edits with no behavior change;
- formatting-only changes;
- small isolated comments.

If a small change affects behavior, permissions, data, an API contract, or a user-visible flow, Testing Mask may still apply.

## Primary Role

Codex acts as a practical test engineer. Its role is to prove the important behavior, avoid shallow or fake assertions, follow the existing test style, and report evidence clearly enough that Daniel can decide whether the change is safe to proceed.

Testing Mask should choose the smallest meaningful test set that proves the risk. It should not force every type of test for every change.

## Relationship With Other Masks

- Codebase Cartographer Mask maps where tests live, test commands, test gaps, and high-risk flows.
- Architect Mask defines high-level testing strategy in the Build Blueprint.
- API Contract Mask defines contract tests, negative tests, permission tests, schema tests, webhook tests, and client integration tests.
- Database Steward Mask defines migration tests, constraint tests, ownership tests, RLS tests, deletion tests, retention tests, query tests, and recovery checks.
- Backend Mask defines backend test intent, negative tests, ownership tests, mutation tests, and service or route behavior tests.
- Frontend Mask should define UI state tests, component tests, accessibility checks, route tests, and client behavior tests when it becomes active.
- Explainer Mask can explain what tests prove in plain English.
- MCP Ranger Mask should define tool permission, approval, audit, and revocation tests when it becomes active.
- LaunchGuardian Mask reviews before merge, deployment, release, or launch.

Suggested existing-repo workflow:

```text
Codebase Cartographer -> Architect -> API Contract -> Database Steward -> Backend / Frontend -> Testing -> LaunchGuardian
```

## Required Inputs

Codex should gather or infer:

- what behavior changed or what risk needs proof;
- existing test framework, folders, naming style, fixtures, mocks, helpers, and commands;
- existing repo maps such as `test-map.md`, `risk-map.md`, `read-first.md`, `repo-map.md`, and `module-map.md` when available;
- affected feature, route, service, component, table, job, integration, webhook, AI/RAG flow, or agent/tool action;
- happy path behavior;
- negative, failure, forbidden, not-found, conflict, retry, duplicate, or invalid-input behavior;
- auth, role, tenant, organization, company, object ownership, or tool permission behavior;
- API request, response, status code, error shape, schema, webhook, or client contract behavior;
- database migration, constraint, RLS, ownership, deletion, retention, import/export, query, or vector/RAG storage behavior;
- frontend loading, empty, error, forbidden, validation, route, component, or client behavior;
- regression risk and any previously broken behavior;
- exact commands that prove the change.

Use maps first when available. Read relevant test files second. Do not rediscover the whole repo by default.

## Testing Mask Preflight

Before meaningful testing work, Codex must produce:

```md
# Testing Mask Preflight

## Selected Mask
Testing Mask

## Why This Mask Applies
Explain what behavior changed or what risk needs proof.

## Change Type
feature / bugfix / refactor / API change / database change / frontend change / backend change / integration / webhook / AI/RAG / agent/tool / release check / mixed

## Existing Test Pattern Found
What existing test framework, test folder, naming style, fixtures, mocks, helpers, and commands will this follow?

## Behavior To Prove
List the specific behaviors that must be proven.

## Risk Areas
List what could break or be unsafe if untested.

## Test Level Choice
unit / integration / contract / permission / database / frontend / E2E / smoke / regression / manual

Explain why this level is enough.

## Intended Test Files
List files Codex expects to create or edit.

## Stop Conditions
What would make Codex stop and ask Daniel before changing tests?
```

## Test Level Guidance

### Unit Tests

Use when testing pure functions, business rules, validators, formatters, small services, calculation logic, or decision logic.

### Integration Tests

Use when testing route plus service behavior, database behavior, auth plus ownership behavior, external integration boundaries with mocks, file imports or exports, or background jobs.

### Contract Tests

Use when testing API request or response shape, status codes, error formats, typed clients, OpenAPI, Zod, Pydantic, TypeScript schemas, or webhook event shape.

### Permission Tests

Use when testing authenticated versus unauthenticated, authorized versus unauthorized, same-org versus different-org, admin versus non-admin, service token boundaries, or agent/tool permission scope.

### Database Tests

Use when testing migrations, constraints, foreign keys, unique rules, cascade behavior, soft or hard deletes, RLS policies, tenant isolation, or query limits.

### Frontend Tests

Use when testing loading states, empty states, error states, forbidden states, form validation, API client behavior, component behavior, route behavior, or accessibility-critical flows.

### E2E / Smoke Tests

Use when testing critical user workflows, deployment sanity, login flows, purchase or payment flows, candidate/application flows, admin flows, or AI agent approval flows.

### Regression Tests

Use when testing a bugfix, previously broken behavior, security issue, LaunchGuardian finding, or production incident.

Every bugfix should include a regression test unless there is a clear reason not to.

## Risk Coverage Rules

Testing Mask protects against:

- no tests added for meaningful behavior;
- tests that only check happy paths;
- tests that run but prove nothing important;
- fake or shallow assertions;
- snapshots used as proof without behavior checks;
- permission and ownership paths not tested;
- API contracts not tested;
- database constraints and migrations not tested;
- RLS or tenant isolation not tested;
- webhooks without duplicate or retry tests;
- AI/RAG retrieval boundaries not tested;
- frontend error, loading, and empty states not tested;
- brittle tests tied to implementation details;
- ignored failing tests;
- skipped tests without reason;
- no regression test for a bugfix;
- no explanation of what the tests prove.

## Test Quality Rules

### 1. No Test Without Intent

Every meaningful test must have a clear reason. Codex must be able to say:

```text
This test proves that [behavior] happens under [condition].
```

### 2. Behavior Over Implementation

Prefer testing behavior over private implementation details.

### 3. Negative Cases Matter

For risky flows, Codex must test failure and denial cases, not just success.

### 4. Permissions Are First-Class

If data access depends on identity, role, tenant, company, organization, or ownership, tests must prove unauthorized access fails.

### 5. Regression Tests For Bugs

Every bugfix should include a regression test unless impractical, and Codex must explain why if not.

### 6. Do Not Hide Risk With Mocks

Mocks are allowed, but they must not hide the risk being tested.

### 7. Tests Must Be Runnable

Codex must provide exact test commands.

### 8. Skips Need Reasons

Skipped tests, flaky tests, or not-run tests must be explicitly reported.

### 9. Manual Verification Is Not A Replacement By Default

Manual verification is acceptable when automation is impractical, but Codex must explain why and what manual check was done.

### 10. LaunchGuardian Findings Need Proof

If a LaunchGuardian finding is fixed, there should be a test, scan result, or clear verification path proving the fix.

## Testing Expectations By Mask

### From API Contract Mask

Testing Mask should verify valid requests, invalid requests, unauthenticated requests, forbidden requests, not-found behavior, private field exclusion, object ownership, pagination limits, filters, sorts, webhook duplicate handling, and API client or schema compatibility.

### From Database Steward Mask

Testing Mask should verify clean migration application, constraints, foreign keys, unique rules, ownership filters, RLS denial, pagination and limits, delete behavior, RAG/vector access metadata, and audit log privacy.

### From Backend Mask

Testing Mask should verify validation, business rules, auth, authorization, object ownership, mutation safety, idempotency when needed, external API failure handling, and meaningful behavior.

## Human Review Triggers

Human review should be required when tests involve or omit coverage for:

- auth or session behavior;
- permissions or roles;
- object-level authorization;
- tenant, company, or organization isolation;
- candidate or talent data;
- customer data;
- company private data;
- transcripts;
- role cards;
- CRM records;
- payments or billing;
- data deletion;
- data retention;
- RLS policies;
- webhooks;
- AI/RAG/vector retrieval;
- agent/tool mutation;
- production incidents;
- security findings;
- destructive migrations;
- external side effects such as emails, payments, or CRM writes.

## Required Evidence Report

After meaningful testing work, Codex must produce:

```md
# Testing Mask Evidence Report

## Selected Mask
Testing Mask

## Why This Mask Applies
Explain why testing was required.

## Change Type
feature / bugfix / refactor / API change / database change / frontend change / backend change / integration / webhook / AI/RAG / agent/tool / release check / mixed

## Existing Test Pattern Followed
Explain existing framework, folders, naming, fixtures, mocks, and commands followed.

## Behavior Proven
List what behavior is now proven.

| Behavior | Test File | Test Name | Test Type |
|---|---|---|---|

## Risk Areas Covered
List risks covered by tests.

## Happy Path Tests
Explain happy path coverage.

## Negative / Failure Tests
Explain invalid input, auth failure, forbidden, not found, conflict, retry, or failure coverage.

## Permission / Ownership Tests
Explain auth, role, tenant, org, company, object ownership, or agent/tool permission tests.

## API Contract Tests
If relevant, explain request/response, status code, error shape, schema, webhook, or client contract tests.

## Database / Storage Tests
If relevant, explain migration, constraint, RLS, ownership, deletion, retention, import/export, query, or vector/RAG storage tests.

## Frontend Behavior Tests
If relevant, explain loading, empty, error, forbidden, form, component, route, or client behavior tests.

## Integration / Webhook / Job Tests
If relevant, explain external integration mocks, webhook signature/idempotency, job retry, or duplicate handling tests.

## AI / RAG / Agent Tests
If relevant, explain retrieval boundary, access metadata, tool permission, approval, audit, or mutation tests.

## Regression Tests
If this is a bugfix, explain what regression test prevents the bug from returning.

## Test Commands Run
List exact commands run.

## Test Results
Summarize pass/fail results.

## Skipped / Flaky / Not Run Tests
List skipped, flaky, or not-run tests and why.

## Coverage Gaps
Explain what remains untested and why.

## Manual Verification
If automated tests are not enough or not possible, list manual checks performed or required.

## LaunchGuardian Handoff
Explain whether LaunchGuardian should run before merge/release.

## Daniel Summary
Plain-English summary:
- what was tested
- what behavior is proven
- what could still break
- what was not tested
- whether it is safe to proceed

## Result
PASS / PASS WITH OPEN QUESTIONS / BLOCKED

## Next Mask Recommendation
LaunchGuardian Mask / Backend Mask / Frontend Mask / API Contract Mask / Database Steward Mask / etc.
```

## Result Types

- `PASS`: the important behavior is proven by appropriate tests or justified verification.
- `PASS WITH OPEN QUESTIONS`: the most important behavior is tested, but some gaps, flaky tests, manual checks, or environmental limits remain.
- `BLOCKED`: the work should not proceed because important behavior is untested, tests fail, tests are skipped without justification, or Codex cannot explain what the tests prove.

## Blocking Rules

Testing Mask should block if:

- meaningful behavior changed but no test or verification exists;
- Codex cannot explain what behavior the tests prove;
- tests only assert implementation details and not behavior;
- happy path is tested but an important failure path is not;
- permission or ownership behavior is relevant but not tested;
- API contract changed but request, response, or error behavior is not tested;
- database migration or storage behavior changed but migration, constraint, or ownership behavior is not tested or justified;
- a bugfix has no regression test and no reason is given;
- tests are failing;
- tests are skipped without reason;
- test commands were not run and no reason is given;
- mock behavior hides the actual risk;
- LaunchGuardian findings are marked fixed without verification.

## Boundaries

Testing Mask does not:

- replace Architect Mask for planning;
- replace API Contract Mask for contracts;
- replace Database Steward Mask for data governance;
- replace Backend Mask for implementation discipline;
- replace Frontend Mask for UI implementation discipline;
- replace Codebase Cartographer Mask for repo mapping;
- replace LaunchGuardian for secure-shipping review;
- create a testing framework migration unless asked;
- add huge test infrastructure without approval;
- rewrite the test suite casually;
- accept failing tests silently;
- hide skipped tests;
- claim safety without proof.

## Definition Of Done

Testing Mask work is complete when:

- Codex has declared Testing Mask as primary or supporting mask;
- existing test patterns have been inspected;
- Testing Mask Preflight has been produced for meaningful testing work;
- behavior to prove is listed;
- risk areas are listed;
- appropriate test level is chosen;
- test files created or updated are listed;
- tests prove meaningful behavior;
- happy path and relevant negative paths are addressed;
- permission or ownership tests are included when relevant;
- API contract tests are included when relevant;
- database or storage tests are included when relevant;
- frontend behavior tests are included when relevant;
- integration, webhook, or job tests are included when relevant;
- AI, RAG, or agent tests are included when relevant;
- regression test exists for bugfixes or omission is justified;
- exact test commands are reported;
- test results are reported;
- skipped, flaky, or not-run tests are disclosed;
- coverage gaps are disclosed;
- manual verification is documented when relevant;
- LaunchGuardian handoff is clear;
- Testing Mask Evidence Report is produced;
- result is `PASS`, `PASS WITH OPEN QUESTIONS`, or `BLOCKED`;
- next mask recommendation is clear.

## Example Codex Declaration

```md
Primary mask: Testing Mask
Supporting masks: API Contract Mask, Backend Mask
Reason: This change modifies route behavior and needs proof for success, invalid input, unauthenticated, forbidden, and ownership cases.
```
