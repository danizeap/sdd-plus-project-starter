# Brief

## Change

add-lgf-project-onboarding-pack

## User Need

Projects using SDD+ and LGF need a repeatable onboarding process before launch-readiness work begins.

## Problem

LGF has gate definitions and applicability rules, but the starter does not yet define when to activate LGF onboarding or the minimum onboarding packet required before launch.

## Scope

In scope:

- Add an LGF project onboarding spec.
- Add a project security readiness template.
- Define activation triggers, onboarding sequence, readiness statuses, and minimum launch packet checklist.
- Update `CODEX.md` with a short onboarding recommendation rule.
- Update the active SDD+ change packet.

Out of scope:

- Scanner code, CLI code, automation, or runtime enforcement.
- Application logic.
- Company-specific policy.

## Acceptance Criteria

- [ ] `sdd-plus/specs/lgf-project-onboarding.md` exists.
- [ ] `sdd-plus/security/project-security-readiness.template.md` exists.
- [ ] LGF activation triggers are documented.
- [ ] Onboarding sequence is documented.
- [ ] Project readiness statuses are documented.
- [ ] Minimum LGF packet before launch checklist is documented.
- [ ] `CODEX.md` recommends LGF onboarding for deployable/data/API/AI/integration projects.
- [ ] Change packet is updated and verified.

## Impact Areas

- Backend: None.
- Frontend: None.
- Data model: None.
- API: None.
- AI/model behavior: Agent operating instructions updated.
- Documentation: Adds LGF onboarding spec and readiness template.
- Operations/security: Adds reusable project onboarding process.

## Open Questions

- None for this docs/templates/process-only change.
