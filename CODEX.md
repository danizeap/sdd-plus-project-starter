# Universal SDD+ Agent Instructions

Use this file as the first source of truth when an agent opens the project.

## First-Run Context Rule

Before making meaningful changes, check whether `PROJECT_CONTEXT.md` exists and contains real project-specific answers.

If it is missing, empty, or still generic:

1. Stop before implementation.
2. Ask the user for project context.
3. Create `PROJECT_CONTEXT.md` from `PROJECT_CONTEXT.template.md`.
4. Summarize assumptions clearly.
5. Then proceed with SDD+.

Do not invent project context. If the user is unsure, write assumptions explicitly and mark open questions.

## Context Questions To Ask

Ask only what is needed for the current phase, but cover these when starting a project:

- What are we building?
- Who is it for?
- What problem does it solve?
- What outcome matters most?
- What stack, tools, services, or platforms should we use?
- What should we avoid?
- What data, APIs, accounts, or integrations matter?
- What security, privacy, budget, or deployment constraints exist?
- What does a useful first version look like?

## SDD+ Workflow

Use SDD+ for meaningful changes:

1. Read `PROJECT_CONTEXT.md`.
2. Read relevant files in `sdd-plus/standards/`.
3. Create or select an active change under `sdd-plus/changes/`.
4. Keep edits aligned with the active change packet.
5. Update `tasks.md`, `decision-log.md`, and `verification.md` as work progresses.
6. Update README, standards, or specs when behavior, setup, APIs, data, deployment, or model usage changes.
7. Run `.\scripts\sdd.ps1 verify <change-name>` before calling implementation complete.

Commands:

```powershell
.\scripts\sdd.ps1 init
.\scripts\sdd.ps1 new <kebab-change-name>
.\scripts\sdd.ps1 status
.\scripts\sdd.ps1 verify <kebab-change-name>
.\scripts\sdd.ps1 archive <kebab-change-name>
```

## Token-Smart Rule

Follow `sdd-plus/standards/token-smart-standards.md`.

Start with the smallest reliable context and expand only when evidence requires it. Spend more context for security, production data, customer-facing behavior, architecture, and hard-to-undo changes.

## Guardrails

- Never commit secrets, API keys, `.env`, credentials, local downloads, virtual environments, build artifacts, or caches.
- Prefer project-specific facts from files over chat memory.
- Treat data model, auth, deployment, and security changes as high-impact.
- Do not rewrite unrelated code or revert user changes unless explicitly asked.
- Keep work auditable through SDD+ change packets.
