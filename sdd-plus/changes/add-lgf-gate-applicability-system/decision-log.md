# Decision Log

## Change

add-lgf-gate-applicability-system

## Decisions

| Date | Decision | Reason | Alternatives Considered |
| --- | --- | --- | --- |
| 2026-06-09 | Add LGF gate applicability as docs/templates/process only. | The requested change defines how projects decide which gates apply before launch, not scanner automation. | Building scanner or CLI code now, which is out of scope. |
| 2026-06-09 | Use `gate-applicability.output.template.yml` as the reusable project output template. | Projects need a copyable output format for `sdd-plus/security/gate-applicability.yml`. | Reusing the existing framework template directly, which is less explicit as a project output. |
| 2026-06-09 | Keep always-on gates and conditional triggers explicit in both spec and template. | Future agents need stable rules before applying LGF to a project. | Leaving applicability to ad hoc judgment. |
| 2026-06-09 | Require evidence and human confirmation for high-risk skipped gates. | Agents may infer applicability, but humans must approve risky exclusions. | Allowing skipped high-risk gates without confirmation. |
