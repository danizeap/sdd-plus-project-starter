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
