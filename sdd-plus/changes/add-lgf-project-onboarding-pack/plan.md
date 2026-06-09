# Plan

## Change

add-lgf-project-onboarding-pack

## Approach

Add the LGF onboarding pack as framework documentation and a reusable readiness template. Keep it generic, reusable, and separate from scanner or application implementation.

## Files Expected To Change

- `CODEX.md`
- `sdd-plus/specs/lgf-project-onboarding.md`
- `sdd-plus/security/project-security-readiness.template.md`
- `sdd-plus/changes/add-lgf-project-onboarding-pack/*.md`

## Risks

- The onboarding process could imply automated scanning that does not exist yet.
- The template could become too project-specific if it includes assumptions about a stack or organization.

## Rollback

Revert the added spec/template and related `CODEX.md` and change-packet edits.
