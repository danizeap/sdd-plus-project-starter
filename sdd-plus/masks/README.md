# Codex Mask Collection

The Codex Mask Collection defines reusable operating procedures for AI-assisted software development.

A Codex Mask is not just a prompt. It is a structured way for Codex to work in a specific kind of task. Each mask defines a role, framework, checklist, required inputs, required outputs, pass/fail rules, evidence requirements, boundaries, and a definition of done.

Masks exist so Daniel can move from idea to implementation to review with more consistency and less manual re-auditing. The goal is to make Codex identify the right operating mode before changing files, architecture, behavior, configuration, security posture, tests, or documentation.

## Where Masks Live

Masks live in this directory:

```text
sdd-plus/masks/
```

The central registry is:

```text
sdd-plus/masks/mask-registry.yml
```

Each mask has its own folder and `mask.md` file.

## Mask Selection Rule

Before meaningful work, Codex must identify the applicable mask or masks.
Codex must declare one primary mask.
Codex may declare supporting masks.
If no mask fits, Codex must propose a new mask instead of improvising.

For trivial edits, typo fixes, or formatting-only changes, Codex may state that no full mask execution is required.

## How Codex Chooses Masks

Codex should review `mask-registry.yml`, compare the task against each mask's purpose and use cases, then select:

- one primary mask that owns the work;
- optional supporting masks when another domain adds important constraints;
- no full mask execution only for trivial edits.

If the task does not fit a registered mask, Codex should propose a new mask with a short purpose, intended use, and likely required outputs before proceeding.

## What Every Mask Must Define

Every completed mask should define:

- metadata: id, name, status, version, owner, and last updated date;
- purpose;
- when to use the mask;
- when not to use the mask;
- primary role;
- required inputs;
- required outputs;
- operating procedure;
- pass/fail rules;
- evidence requirements;
- boundaries;
- definition of done;
- example Codex declaration;
- example evidence report.

## Evidence Requirements

When a task changes files, architecture, behavior, configuration, security posture, tests, or documentation, Codex should produce a Mask Evidence Report.

At minimum, the report should identify:

- selected primary mask;
- supporting masks, if any;
- why the mask applies;
- files inspected;
- files changed;
- decisions made;
- checks or tests run;
- result: PASS, FAIL, or PASS WITH FOLLOW-UP;
- risks, assumptions, and follow-up tasks.

Evidence should be practical and readable. It should help Daniel understand what Codex did, why it did it, and whether the result is safe to use.

## Mask Statuses

- `placeholder` - named but not designed yet
- `draft` - designed but not battle-tested
- `active` - usable as a Codex operating procedure
- `graduated` - became its own tool, repo, workflow, or formal subsystem
- `deprecated` - replaced or no longer recommended

## Graduation

A mask can graduate when it becomes more than a documented procedure. Graduation can mean the mask became its own tool, repository, workflow, automated scanner, formal subsystem, or otherwise stable operating layer.

Graduated masks should still remain in the registry so Codex knows when to invoke the tool or workflow and what boundaries apply.

## First Active Planning Mask

Architect is the first active planning mask. It produces a Build Blueprint before implementation when a task involves meaningful system design, such as a new app, major feature, data-backed workflow, integration, AI agent, API, auth, storage, deployment, or long-term maintainability decision.

## First Active Implementation Mask

Backend is the first active implementation mask. It governs backend routes, API handlers, services, server actions, database access, auth, authorization, jobs, webhooks, integrations, server-side config, and server-side AI/RAG/agent logic.

Backend Mask v0.1.1 strengthens development-time discipline with lightweight backend change planning, small-diff expectations, existing-pattern discipline, ownership maps, backend layer contracts, future extension points, and plain-English test intent.

Backend Mask asks:

```text
Is this backend change safe, permissioned, testable, maintainable, and reviewable?
```

Its registry entry is `backend`, and its formal mask definition lives at:

```text
sdd-plus/masks/backend/mask.md
```

## Active API Contract Mask

API Contract Mask is active at v0.1.0. It governs endpoint and interface contracts before backend, frontend, database, testing, or LaunchGuardian implementation work depends on them.

API Contract Mask asks:

```text
Is this API boundary clear, permissioned, stable, testable, documented, and safe for every caller that depends on it?
```

Its registry entry is `api-contract`, and its formal mask definition lives at:

```text
sdd-plus/masks/api-contract/mask.md
```

## Active Database Steward Mask

Database Steward Mask is active at v0.1.0. It governs database/storage design, migrations, ownership, tenant isolation, indexes, sensitive data, deletion, retention, audit trails, backups, and RAG/vector storage.

Database Steward Mask asks:

```text
Is this data model safe, owned, isolated, reversible, queryable, maintainable, and lifecycle-aware?
```

Its registry entry is `database-steward`, and its formal mask definition lives at:

```text
sdd-plus/masks/database-steward/mask.md
```

## Active Codebase Cartographer Mask

Codebase Cartographer Mask is active at v0.1.0. It governs repo mapping, durable codebase maps, read-first guides, token-saving orientation, dependency maps, data-flow maps, API maps, test maps, risk maps, and map freshness.

Codebase Cartographer Mask asks:

```text
Can Codex understand this repo from durable maps before rereading everything or changing code?
```

Its registry entry is `codebase-cartographer`, and its formal mask definition lives at:

```text
sdd-plus/masks/codebase-cartographer/mask.md
```

## Active Testing Mask

Testing Mask is active at v0.1.0. It governs test design, test changes, regression coverage, verification commands, skipped-test disclosure, manual verification, and evidence reporting.

Testing Mask asks:

```text
What behavior must be proven, and what tests prove it?
```

Its registry entry is `testing`, and its formal mask definition lives at:

```text
sdd-plus/masks/testing/mask.md
```

## Active Frontend Mask

Frontend Mask is active at v0.1.0. It governs approved-design implementation, design handoff, frontend architecture, components and routes, client API integration, UI states, responsive behavior, accessibility basics, browser-side security, design fidelity, and Testing and LaunchGuardian handoff.

Frontend Mask asks:

```text
Can this approved design be implemented and connected to the real product without visual drift, fragile frontend code, accessibility failures, browser-side security mistakes, or broken application behavior?
```

Its registry entry is `frontend`, and its formal mask definition lives at:

```text
sdd-plus/masks/frontend/mask.md
```

## Active Explainer Mask

Explainer Mask is active at v0.1.0. It is the understanding and ownership layer that turns meaningful code and system changes into clear, technically honest explanations for Daniel.

Explainer Mask asks:

```text
Can Daniel understand what changed, how it works, where the important logic lives, what could break, and what he should read next?
```

Its registry entry is `explainer`, and its formal mask definition lives at:

```text
sdd-plus/masks/explainer/mask.md
```

Explainer Mask is distinct from Codebase Cartographer Mask. Codebase Cartographer creates durable repo maps for future Codex orientation; Explainer Mask explains a specific change, feature, subsystem, or bugfix to Daniel in plain English and technical layers.

## First Graduated Mask

LaunchGuardian is the first graduated Codex Mask.

LaunchGuardian began as a secure-shipping review procedure and has graduated into `launchguardian-cli`, a local, defensive, permission-bound scanner and review assistant. It answers:

```text
Is this project safe enough to ship?
```

Its registry entry is `launchguardian`, and its formal mask definition lives at:

```text
sdd-plus/masks/launchguardian/mask.md
```
