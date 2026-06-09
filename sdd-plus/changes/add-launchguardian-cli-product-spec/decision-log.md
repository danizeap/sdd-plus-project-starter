# Decision Log

## Change

add-launchguardian-cli-product-spec

## Decisions

| Date | Decision | Reason | Alternatives Considered |
| --- | --- | --- | --- |
| 2026-06-09 | Define LaunchGuardian CLI as a future separate repo/tool. | The SDD+ starter should host framework docs/templates, not scanner implementation. | Adding scanner code or CLI scaffolding to this starter. |
| 2026-06-09 | Specify scanner integrations without implementing them. | The product spec should guide future implementation while keeping this change docs-only. | Installing or wiring scanner tools now. |
| 2026-06-09 | Require permission-bound modes and non-goals. | The future CLI must avoid unauthorized scanning and production active scans by default. | Describing broad offensive scanning capabilities. |
| 2026-06-09 | Normalize scanner findings into a common launch decision model. | LGF needs consistent ship/block reporting across tools. | Leaving each scanner output unmerged and tool-specific. |
