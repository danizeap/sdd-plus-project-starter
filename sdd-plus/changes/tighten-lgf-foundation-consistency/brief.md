# Brief

## Change

tighten-lgf-foundation-consistency

## User Need

Future LGF and LaunchGuardian CLI work needs the foundation docs/templates to use one consistent launch policy and template interpretation.

## Problem

The LGF foundation had small consistency gaps across critical finding rules, gate applicability templates, readiness checklist wording, and CLI implementation-readiness details.

## Scope

In scope:

- Align Critical finding launch-blocker language across LGF docs/templates.
- Clarify neutral gate applicability template versus project-use output template.
- Add missing high-risk skip checklist field and related gates to project readiness template.
- Strengthen the CLI product spec with commands, exit codes, config discovery, scanner availability behavior, report layout, schema/versioning, and canonical gate reference rules.
- Update the active SDD+ change packet.

Out of scope:

- Scanner code.
- CLI implementation.
- Application logic.
- Company-specific policy.

## Acceptance Criteria

- [ ] Critical blocker rule is consistent across LGF files.
- [ ] Gate applicability template roles are clarified.
- [ ] Project readiness high-risk skip checklist includes `human_confirmation_required: true`.
- [ ] Project readiness template includes related gate metadata.
- [ ] CLI product spec has enough detail to scaffold a separate repo.
- [ ] Change packet is updated and verified.

## Impact Areas

- Backend: None.
- Frontend: None.
- Data model: None.
- API: None.
- AI/model behavior: Agent operating instructions updated.
- Documentation: Tightens LGF specs/templates and CLI product spec.
- Operations/security: Clarifies launch-blocking and gate-skip policy.

## Open Questions

- None for this docs/templates/spec-only change.
