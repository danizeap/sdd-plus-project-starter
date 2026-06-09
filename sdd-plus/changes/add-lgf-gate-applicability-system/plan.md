# Plan

## Change

add-lgf-gate-applicability-system

## Approach

Define the gate applicability system as framework documentation and a reusable project output template. Use existing LGF files as source of truth, keep the starter generic, and avoid scanner or application logic.

## Files Expected To Change

- `CODEX.md`
- `sdd-plus/specs/lgf-gate-applicability-system.md`
- `sdd-plus/security/gate-applicability.output.template.yml`
- `sdd-plus/changes/add-lgf-gate-applicability-system/*.md`

## Risks

- The output template could imply automation that does not exist yet.
- Gate skip rules could be too loose if human confirmation requirements are not explicit.

## Rollback

Revert the added spec/template and the related `CODEX.md` and change-packet edits.
