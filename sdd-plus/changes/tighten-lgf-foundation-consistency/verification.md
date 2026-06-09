# Verification

## Change

tighten-lgf-foundation-consistency

## Automated Checks

- [x] `powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\sdd.ps1 verify tighten-lgf-foundation-consistency`

## Manual Checks

- [x] Confirmed change is framework/spec/template work only.
- [x] Confirmed no scanner code or application logic was added.
- [x] Confirmed Critical blocker rule is uniform across LGF files.
- [x] Confirmed exceptional Critical override is labeled exceptional, not normal approval.
- [x] Confirmed gate applicability template roles are clarified.
- [x] Confirmed readiness high-risk skip checklist includes `human_confirmation_required: true`.
- [x] Confirmed project readiness template includes related gates.
- [x] Confirmed CLI spec includes command examples, exit codes, config discovery, scanner availability behavior, report layout, schema/versioning, and canonical gate reference rule.
- [x] Confirmed starter remains generic and not company-specific.

## Documentation Updates

- [x] README update not needed; starter setup commands did not change.
- [x] Project context updated, if needed. Not needed; starter remains generic.
- [x] Specs updated, if needed.
- [x] Security templates updated, if needed.
- [ ] No documentation update needed. Reason: Documentation was updated.

## Result

Passed.
