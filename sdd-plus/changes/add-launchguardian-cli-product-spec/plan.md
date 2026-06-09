# Plan

## Change

add-launchguardian-cli-product-spec

## Approach

Add a product and technical specification for the future LaunchGuardian CLI as a separate repo/tool. Keep this repo as framework documentation/templates only and avoid any scanner or application implementation.

## Files Expected To Change

- `CODEX.md`
- `sdd-plus/specs/launchguardian-cli-product-spec.md`
- `sdd-plus/changes/add-launchguardian-cli-product-spec/*.md`

## Risks

- The spec could be mistaken for an implementation commitment inside this starter.
- Scanner behavior could be described too aggressively without permission and scope boundaries.

## Rollback

Revert the added spec and related `CODEX.md` and change-packet edits.
