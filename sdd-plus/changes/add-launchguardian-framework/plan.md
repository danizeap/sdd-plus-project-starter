# Plan

## Change

add-launchguardian-framework

## Approach

Add the LaunchGuardian Framework as documentation and templates only. Keep the starter generic and avoid any scanner, application code, or company-specific assumptions.

## Files Expected To Change

- `CODEX.md`
- `sdd-plus/specs/launchguardian-framework.md`
- `sdd-plus/standards/security-shipping-standards.md`
- `sdd-plus/security/*.template.*`
- `sdd-plus/changes/add-launchguardian-framework/*.md`

## Risks

- The framework could become too specific to one company, stack, or application type.
- The templates could imply automated enforcement that does not exist yet.

## Rollback

Revert the added LGF docs/templates and the related `CODEX.md` and change-packet edits.
