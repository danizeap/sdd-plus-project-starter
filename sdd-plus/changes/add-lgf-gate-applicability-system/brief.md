# Brief

## Change

add-lgf-gate-applicability-system

## User Need

Projects using LGF need a repeatable way to decide which security gates apply before launch.

## Problem

LGF defines gates, but the starter does not yet define a project output process for marking gates as applicable, skipped, or unknown with evidence and human confirmation rules.

## Scope

In scope:

- Add a durable gate applicability system spec.
- Add a reusable `gate-applicability.yml` output template.
- Define applicability statuses, confidence levels, evidence requirements, always-on gates, conditional trigger rules, and high-risk skip enforcement.
- Add a generic SaaS AI app example matrix.
- Update `CODEX.md` and the active change packet.

Out of scope:

- Scanner code, CLI code, automation, or runtime enforcement.
- Application logic.
- Company-specific policy.

## Acceptance Criteria

- [ ] `sdd-plus/specs/lgf-gate-applicability-system.md` exists.
- [ ] `sdd-plus/security/gate-applicability.output.template.yml` exists.
- [ ] Statuses, confidence levels, evidence requirements, high-risk skip enforcement, always-on gates, conditional triggers, and an example matrix are documented.
- [ ] `CODEX.md` tells agents to create or update `gate-applicability.yml` before applying LGF.
- [ ] Change packet is updated and verified.

## Impact Areas

- Backend: None.
- Frontend: None.
- Data model: None.
- API: None.
- AI/model behavior: Agent operating instructions updated.
- Documentation: Adds LGF gate applicability spec and output template.
- Operations/security: Adds reusable launch gate applicability process.

## Open Questions

- None for this docs/templates/process-only change.
