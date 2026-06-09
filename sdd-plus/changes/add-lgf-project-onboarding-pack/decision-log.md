# Decision Log

## Change

add-lgf-project-onboarding-pack

## Decisions

| Date | Decision | Reason | Alternatives Considered |
| --- | --- | --- | --- |
| 2026-06-09 | Add LGF project onboarding as docs/templates/process only. | The requested change defines a repeatable onboarding pack, not scanner or app implementation. | Building scanner automation now, which is out of scope. |
| 2026-06-09 | Add a readiness template separate from launch decision. | Projects need a lightweight status record before the final launch decision file is ready. | Overloading the launch decision template with onboarding progress. |
| 2026-06-09 | Use generic activation triggers. | The SDD+ starter must work for personal, client, and company projects across stacks. | Encoding project- or company-specific triggers. |
| 2026-06-09 | Keep accepted risks and launch decision in the minimum packet. | Launch readiness requires explicit risk ownership and a final ship/block call. | Treating inventories alone as sufficient launch readiness. |
