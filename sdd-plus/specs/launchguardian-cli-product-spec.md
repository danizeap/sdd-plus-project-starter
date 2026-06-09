# LaunchGuardian CLI Product Spec

## Purpose

LaunchGuardian CLI is a future separate repo/tool that consumes LaunchGuardian Framework (LGF) files from SDD+ projects.

The CLI should read project LGF files, run security checks and scanners, normalize findings, and output ship/block reports. It should help teams decide whether a project is safe enough to launch, but it must not replace human security review or human approval of high-risk exceptions.

This SDD+ starter only hosts the product and technical specification. It does not implement scanner code, CLI code, or application logic.

## Supported Modes

- Local scan: run against a local project path during development.
- CI scan: run in continuous integration on pull requests or protected branches.
- Release gate scan: run before production deploy and fail when launch-blocking conditions exist.
- Staging scan later: run dynamic checks against an explicitly authorized staging URL.

## Inputs

Required and optional inputs:

- Project path.
- Optional staging URL.
- `sdd-plus/security/gate-applicability.yml`.
- `sdd-plus/security/scope-contract.yml`.
- `sdd-plus/security/product-inventory.yml`.
- `sdd-plus/security/data-inventory.yml`.
- `sdd-plus/security/auth-role-matrix.yml`.
- `sdd-plus/security/dependency-policy.yml`.
- `sdd-plus/security/launch-decision.yml` or `sdd-plus/security/launch-decision.md`.

The CLI should fail closed when required LGF files are missing for a release gate scan. Local scans may report missing files as setup findings.

## Outputs

Expected report outputs:

- `launchguardian-report.md`.
- `launchguardian-report.json`.
- `normalized-findings.json`.
- Raw scanner outputs.
- Optional updated `launch-decision.md`.

Raw scanner outputs should be stored separately from normalized findings so users can inspect original tool results without losing the unified launch decision model.

## First Scanner Integrations

Initial integrations should be permission-bound and conservative:

- Semgrep for static code security.
- Gitleaks for secrets.
- Trivy for dependencies, filesystem, container, and IaC checks.
- Custom frontend artifact scanner.
- Custom API inventory and auth heuristic scanner.
- OWASP ZAP later for authorized staging scans.

ZAP active scanning must not run against production by default.

## Normalized Finding Schema

Every scanner, analyzer, or manual rule should normalize findings into this shape:

```yaml
title: ""
severity: "critical | high | medium | low | info"
status: "open | fixed | accepted | false_positive | needs_review"
category: ""
source: ""
file_path: ""
line: null
endpoint: ""
description: ""
risk: ""
recommendation: ""
related_gate: ""
blocks_launch: false
```

Field meanings:

- `title`: short human-readable finding name.
- `severity`: launch impact severity.
- `status`: current review status.
- `category`: security category, such as secrets, dependency, frontend exposure, API authorization, or privacy.
- `source`: scanner, analyzer, rule, or human review source.
- `file_path`: file path when applicable.
- `line`: line number when applicable.
- `endpoint`: route, URL, or API endpoint when applicable.
- `description`: what was found.
- `risk`: why it matters.
- `recommendation`: what to do next.
- `related_gate`: LGF gate connected to the finding.
- `blocks_launch`: whether this finding blocks launch under LGF rules.

## Launch Decision Rules

The CLI should apply LGF launch rules consistently:

- Critical open findings block launch.
- High findings block launch unless accepted by a human owner with documented reason, mitigation, and review date.
- Medium findings do not block launch by default, but should be tracked.
- Low findings do not block launch by default, but may be tracked as hardening work.
- Skipped high-risk gates without required confirmation block launch.

For any high-risk gate, `applies: false` is invalid unless all of the following are filled:

- `human_confirmation_required: true`
- `confirmed_by`
- `confirmed_at`
- `reason`
- `evidence`

Release gate scans should return a non-zero exit code when launch is blocked.

## Future Separate Repo Architecture

The CLI should live in a separate implementation repo, not in the SDD+ starter:

```text
launchguardian-cli/
|-- launchguardian/
|   |-- cli.py
|   |-- orchestrator.py
|   |-- models.py
|   |-- report_writer.py
|   |-- severity.py
|   |-- scanners/
|   |-- analyzers/
|   |-- templates/
|   `-- rules/
|-- tests/
|-- pyproject.toml
`-- README.md
```

Suggested module responsibilities:

- `cli.py`: parse commands, inputs, modes, and exit codes.
- `orchestrator.py`: coordinate LGF file loading, scanners, analyzers, normalization, and report writing.
- `models.py`: define typed data models for gates, evidence, findings, reports, and launch decisions.
- `report_writer.py`: write Markdown, JSON, and normalized output artifacts.
- `severity.py`: map scanner severities into LGF severity and launch-blocking rules.
- `scanners/`: wrappers around Semgrep, Gitleaks, Trivy, ZAP later, and custom scanners.
- `analyzers/`: repo cartography, frontend artifact checks, API/auth heuristics, and LGF consistency checks.
- `templates/`: report templates.
- `rules/`: LGF launch rules, skip enforcement, and gate-specific policy helpers.

## Non-Goals

LaunchGuardian CLI must not be:

- An unauthorized scanning tool.
- An offensive exploitation framework.
- A production active scanner by default.
- A replacement for human security review.

Additional constraints:

- No scope, no scan.
- Do not scan third-party assets without written authorization.
- Do not run destructive tests by default.
- Do not run active dynamic scans against production by default.
- Do not store secrets or sensitive production data in reports.

## Relationship To SDD+

SDD+ projects host LGF specs, templates, and project-specific security records. The future CLI consumes those files and produces reports.

The SDD+ starter should remain framework documentation and templates only unless work is explicitly happening in the future `launchguardian-cli` implementation repo.
