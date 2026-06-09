# Brief

## Change

add-launchguardian-framework

## User Need

Projects using the SDD+ starter need a generic security-shipping layer that future agents and humans can apply before deployable work launches.

## Problem

The starter has SDD+ process standards but no durable framework for launch gates, security evidence, risk acceptance, or launch decisions.

## Scope

In scope:

- Add a generic LaunchGuardian Framework spec.
- Add security shipping standards.
- Add reusable LGF templates under `sdd-plus/security/`.
- Update agent instructions to require LGF for deployable projects.
- Update the active SDD+ change packet.

Out of scope:

- Building a scanner, app, runtime, or automation engine.
- Adding application code.
- Adding company-specific or project-specific policy.

## Acceptance Criteria

- [ ] LGF spec exists under `sdd-plus/specs/`.
- [ ] Security shipping standards exist under `sdd-plus/standards/`.
- [ ] Required LGF templates exist under `sdd-plus/security/`.
- [ ] `CODEX.md` tells future agents how to apply LGF.
- [ ] Change packet records decisions and verification.

## Impact Areas

- Backend: None.
- Frontend: None.
- Data model: None.
- API: None.
- AI/model behavior: Agent operating instructions updated.
- Documentation: Adds LGF spec, standards, and templates.
- Operations/security: Adds generic launch-readiness and risk documentation process.

## Open Questions

- None for this docs-only framework layer.
