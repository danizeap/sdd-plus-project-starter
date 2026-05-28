# SDD+ Project Starter

Universal Spec-Driven Development starter for any project.

This repo is intentionally generic. It does not assume WeCo, GPT, AI, web apps, Python, JavaScript, or any specific business context. Use it as the portable SDD+ kit you can copy into personal, client, experimental, or company projects.

## What This Gives You

- A `CODEX.md` instruction file for Codex or any coding agent.
- A required first-step workflow that asks for project context before implementation.
- A `PROJECT_CONTEXT.template.md` for creating a durable project context document.
- An `sdd-plus/` structure for standards, specs, changes, and archive.
- A small PowerShell helper script for creating and verifying SDD+ change packets.
- Token-smart operating standards for keeping long agent sessions efficient.

## Intended Relationship To Other Repos

Use this repo for general projects.

Keep domain-specific frameworks separate:

- GPT/OpenAI-specific helpers can stay in a GPT-focused repo.
- Company-specific context should live in company/project repos.
- Project-specific decisions belong in each project's local `sdd-plus/`.

## How To Use In A New Project

Copy these files/folders into a project root:

```text
CODEX.md
PROJECT_CONTEXT.template.md
scripts/
sdd-plus/
```

Then open the project with Codex and use this first prompt:

```text
Read CODEX.md. If PROJECT_CONTEXT.md does not exist or is incomplete, ask me for the project context first, then create PROJECT_CONTEXT.md before making implementation changes.
```

## First-Run Rule

Before coding, the agent should ask for enough context to create `PROJECT_CONTEXT.md`.

The minimum context:

- What are we building?
- Who is it for?
- What outcome matters most?
- What stack/tools should we use or avoid?
- What constraints, risks, or non-negotiables exist?
- What does "done" mean for the first useful version?

After that, the agent creates `PROJECT_CONTEXT.md`, then uses SDD+ for meaningful changes.

## SDD+ Commands

From the project root:

```powershell
.\scripts\sdd.ps1 init
.\scripts\sdd.ps1 new <kebab-change-name>
.\scripts\sdd.ps1 status
.\scripts\sdd.ps1 verify <kebab-change-name>
.\scripts\sdd.ps1 archive <kebab-change-name>
```

## Project Memory Model

Use files as durable memory:

- `PROJECT_CONTEXT.md` explains the project.
- `sdd-plus/standards/` defines how work should be done.
- `sdd-plus/specs/` stores durable product/technical specs.
- `sdd-plus/changes/` stores active work.
- `sdd-plus/archive/` stores completed work.

Do not rely on chat history for facts the project will need later.

## Suggested Repo Name

Recommended GitHub repo name:

```text
sdd-plus-project-starter
```
