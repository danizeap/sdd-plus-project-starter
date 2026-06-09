# Verification

## Change

add-launchguardian-framework

## Automated Checks

- [x] `powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\sdd.ps1 verify add-launchguardian-framework`

## Manual Checks

- [x] Created folder: `sdd-plus/security`.
- [x] Created file: `sdd-plus/specs/launchguardian-framework.md`.
- [x] Created file: `sdd-plus/standards/security-shipping-standards.md`.
- [x] Created file: `sdd-plus/security/gate-applicability.template.yml`.
- [x] Created file: `sdd-plus/security/scope-contract.template.yml`.
- [x] Created file: `sdd-plus/security/product-inventory.template.yml`.
- [x] Created file: `sdd-plus/security/data-inventory.template.yml`.
- [x] Created file: `sdd-plus/security/threat-model.template.md`.
- [x] Created file: `sdd-plus/security/auth-role-matrix.template.yml`.
- [x] Created file: `sdd-plus/security/dependency-policy.template.yml`.
- [x] Created file: `sdd-plus/security/accepted-risks.template.md`.
- [x] Created file: `sdd-plus/security/launch-decision.template.md`.
- [x] Confirmed the change is docs/templates only.
- [x] Confirmed no scanner or application code was added.
- [x] Confirmed LGF language is generic and not company-specific.
- [x] Confirmed the canonical LGF gate list appears in framework docs and launch templates.
- [x] Confirmed gate applicability includes applies, confidence, evidence, reason, human_confirmation_required, confirmed_by, and confirmed_at.

## Documentation Updates

- [x] README update not needed; this change adds framework docs/templates and does not change starter setup commands.
- [x] Project context updated, if needed. Not needed; starter remains generic.
- [x] Specs updated, if needed.
- [x] Standards updated, if needed.
- [ ] No documentation update needed. Reason: Documentation was updated.

## Result

Passed.
