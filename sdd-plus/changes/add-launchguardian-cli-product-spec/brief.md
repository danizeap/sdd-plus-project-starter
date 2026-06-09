# Brief

## Change

add-launchguardian-cli-product-spec

## User Need

Future LaunchGuardian implementation work needs a durable product and technical spec before scanner code is built.

## Problem

The SDD+ starter defines LGF framework files, onboarding, and gate applicability, but it does not yet define the future separate CLI/scanner product that will consume those files.

## Scope

In scope:

- Add the LaunchGuardian CLI product spec.
- Define purpose, modes, inputs, outputs, first scanner integrations, normalized finding schema, launch decision rules, repo architecture, and non-goals.
- Update `CODEX.md` to keep CLI/scanner implementation separate from this starter.
- Update the active SDD+ change packet.

Out of scope:

- Scanner code.
- Application logic.
- CLI repo scaffolding.
- Runtime scanner integrations.

## Acceptance Criteria

- [ ] `sdd-plus/specs/launchguardian-cli-product-spec.md` exists.
- [ ] CLI purpose is documented.
- [ ] Supported modes are documented.
- [ ] Inputs and outputs are documented.
- [ ] First scanner integrations are documented.
- [ ] Normalized finding schema is documented.
- [ ] Launch decision rules are documented.
- [ ] Future separate repo architecture is documented.
- [ ] Non-goals are documented.
- [ ] `CODEX.md` notes that CLI/scanner is a future separate implementation.
- [ ] Change packet is updated and verified.

## Impact Areas

- Backend: None.
- Frontend: None.
- Data model: None.
- API: None.
- AI/model behavior: Agent operating instructions updated.
- Documentation: Adds future CLI product/technical spec.
- Operations/security: Defines future scanner/reporting product boundaries.

## Open Questions

- None for this product-spec-only change.
