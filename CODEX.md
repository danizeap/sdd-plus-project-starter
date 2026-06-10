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

## Codex Mask Selection Rule

Before starting meaningful work, Codex must identify which Codex Mask or masks apply.

Codex must:

1. Review `sdd-plus/masks/mask-registry.yml`.
2. Declare one primary mask.
3. Declare any supporting masks if relevant.
4. Follow the selected mask's required inputs, outputs, boundaries, and evidence rules.
5. Produce a Mask Evidence Report when the task changes files, architecture, behavior, configuration, security posture, tests, or documentation.
6. If no mask fits, propose a new mask instead of improvising.

For trivial edits, typo fixes, or formatting-only changes, Codex may state that no full mask execution is required.

## Codex Mask Framework Usage Protocol

Before meaningful work, follow `sdd-plus/protocols/framework-usage.md` as the canonical operating protocol.

Declare project type, task summary/type, execution mode, primary/supporting masks, exact recommended model and reasoning level, current-model action, context to load and exclude, approval need, expected artifacts, and stop conditions.

Use one primary mask by default. Add only the smallest sufficient supporting set. Load context progressively. FULL means maximum relevant rigor, not every mask, every file, or every report.

Codex reports. ChatGPT verifies.

## LaunchGuardian Framework

LaunchGuardian Framework (LGF) is required for deployable projects.

Use LGF when work affects launch readiness, security, authentication, authorization, privacy, deployment, database/storage, frontend exposure, infrastructure, dependencies, or production/sensitive data. Refer to `sdd-plus/specs/launchguardian-framework.md` and `sdd-plus/standards/security-shipping-standards.md`.

Agents may propose which LGF gates apply and which gates appear safe to skip. Humans must confirm skipped high-risk gates before launch.

Critical findings block launch until fixed and verified, removed from launch scope, or downgraded by new evidence. Do not mark a deployable change launch-ready while a critical finding remains open.

Treat security, auth, privacy, deployment, database, frontend exposure, and infrastructure changes as high-impact.

Before applying LGF to a project, create or update `sdd-plus/security/gate-applicability.yml` and mark every gate as `applies: true`, `applies: false`, or `applies: unknown` with confidence, evidence, and reasons. Use `sdd-plus/specs/lgf-gate-applicability-system.md` and `sdd-plus/security/gate-applicability.output.template.yml`.

Recommend LGF onboarding when a project is deployable, handles personal or company data, exposes APIs, uses AI/RAG/agents, or depends on integrations, webhooks, background jobs, payments, auth, file flows, or frontend build artifacts. Use `sdd-plus/specs/lgf-project-onboarding.md` and `sdd-plus/security/project-security-readiness.template.md`.

LaunchGuardian CLI/scanner is a future separate implementation. The SDD+ starter should only host framework docs and templates unless the active work is explicitly in the CLI repo. See `sdd-plus/specs/launchguardian-cli-product-spec.md`.

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
