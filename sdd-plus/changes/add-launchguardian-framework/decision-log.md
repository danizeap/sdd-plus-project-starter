# Decision Log

## Change

add-launchguardian-framework

## Decisions

| Date | Decision | Reason | Alternatives Considered |
| --- | --- | --- | --- |
| 2026-06-09 | Add LGF as documentation, standards, and templates only. | The requested change is a framework layer for the starter, not a scanner or application implementation. | Building an automated scanner or adding app code, both out of scope. |
| 2026-06-09 | Keep LGF generic and stack-neutral. | The SDD+ starter is intended for any project and should not encode company-specific assumptions. | Tailoring the framework to a specific organization, product, or technology stack. |
| 2026-06-09 | Require human confirmation for skipped high-risk gates. | Agents can assist with applicability, but launch-risk acceptance needs accountable human review. | Allowing agents to silently skip gates based on inference alone. |
| 2026-06-09 | Critical findings block launch. | Launch decisions need a clear non-negotiable safety bar. | Allowing critical findings to be accepted as routine launch risks. |
