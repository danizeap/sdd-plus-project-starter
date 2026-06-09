# [Mask Name]

## Metadata

- id:
- name:
- status:
- version:
- owner:
- last_updated:

## Purpose

Describe what this mask is responsible for and the outcome it is designed to protect.

## When To Use This Mask

List the task types, signals, or project changes that should trigger this mask.

## When Not To Use This Mask

List cases where another mask should own the work or where no full mask execution is required.

## Primary Role

Define the role Codex should adopt while using this mask.

## Required Inputs

List the context Codex must inspect or request before doing meaningful work.

## Required Outputs

List the artifacts, edits, reports, tests, or decisions this mask must produce.

## Operating Procedure

Define the step-by-step workflow Codex should follow.

## Pass / Fail Rules

Define what makes work acceptable, blocked, or unsafe to ship.

## Evidence Requirements

Define what Codex must include in its Mask Evidence Report.

## Boundaries

Define what this mask must not do.

## Definition of Done

Define the conditions that must be true before Codex can consider the task complete.

## Example Codex Declaration

```text
Primary mask: [Mask Name]
Supporting masks: [Optional Mask Names]
Reason: This task applies because [short reason].
```

## Example Evidence Report

```md
# Mask Evidence Report

## Selected Mask
Backend Mask

## Why This Mask Applies
Because the task changes server routes and auth behavior.

## Files Inspected
- server/routes/users.ts
- server/auth/session.ts

## Files Changed
- server/routes/users.ts
- tests/users.test.ts

## Decisions Made
- Kept existing auth middleware.
- Added ownership check before returning user data.

## Tests Run
- npm test

## Result
PASS

## Risks / Follow-ups
- No rate limiting exists yet.
```
