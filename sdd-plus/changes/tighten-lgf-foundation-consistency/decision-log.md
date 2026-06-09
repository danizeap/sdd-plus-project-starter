# Decision Log

## Change

tighten-lgf-foundation-consistency

## Decisions

| Date | Decision | Reason | Alternatives Considered |
| --- | --- | --- | --- |
| 2026-06-09 | Use one canonical Critical blocker rule across LGF files. | Launch policy must not vary between framework, onboarding, templates, and future CLI behavior. | Keeping looser owner-approval language in onboarding/readiness templates. |
| 2026-06-09 | Name Critical overrides as exceptional overrides only. | Critical issues should not become routine accepted risks. | Treating Critical findings like High findings with normal owner acceptance. |
| 2026-06-09 | Clarify gate applicability template roles instead of merging them. | The neutral schema template is useful for reference, while the output template should apply project defaults. | Making both templates identical and losing their distinct purposes. |
| 2026-06-09 | Add CLI implementation-readiness details to the product spec without adding code. | The future CLI repo needs enough guidance to scaffold cleanly, but this starter should stay docs/templates only. | Creating scanner code or CLI scaffolding in the starter. |
