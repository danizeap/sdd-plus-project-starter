# Plan

## Change

tighten-lgf-foundation-consistency

## Approach

Apply the review fixes directly to existing LGF specs/templates while keeping the starter as framework documentation only. Use a new consistency packet because the edits span multiple prior LGF packets.

## Files Expected To Change

- `CODEX.md`
- `sdd-plus/specs/launchguardian-framework.md`
- `sdd-plus/standards/security-shipping-standards.md`
- `sdd-plus/specs/lgf-gate-applicability-system.md`
- `sdd-plus/specs/lgf-project-onboarding.md`
- `sdd-plus/specs/launchguardian-cli-product-spec.md`
- `sdd-plus/security/gate-applicability.template.yml`
- `sdd-plus/security/gate-applicability.output.template.yml`
- `sdd-plus/security/project-security-readiness.template.md`
- `sdd-plus/security/launch-decision.template.md`
- `sdd-plus/security/accepted-risks.template.md`
- `sdd-plus/security/threat-model.template.md`
- `sdd-plus/changes/tighten-lgf-foundation-consistency/*.md`

## Risks

- Critical override language could accidentally read like normal approval.
- Gate applicability templates could remain ambiguous if their roles are not explicit.
- CLI spec could drift into implementation instead of product specification.

## Rollback

Revert this consistency packet's documentation/template/spec edits.
