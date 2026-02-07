# Four Validation Levels

References:

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference

## Level 1: Manifest Validation

Goal: ensure `.claude-plugin/plugin.json` is parseable and schema/CI compatible.

Checks:

- JSON parse succeeds.
- Required CI fields exist and are non-empty strings (`name`, `version`, `description`).
- `name` matches `^[a-z0-9-]+$`.

Script:

- `scripts/verify-manifest.sh`

## Level 2: Structure Validation

Goal: ensure plugin components are in expected directories.

Checks:

- Required directories exist at plugin root (`skills/`, `agents/`, `hooks/`).
- `hooks/hooks.json` exists.
- Each skill directory has `SKILL.md`.
- No misplaced component directories inside `.claude-plugin/`.

Script:

- `scripts/verify-structure.sh`

## Level 3: Load Validation

Goal: ensure Claude CLI can discover/load plugin components.

Checks:

- Optional install/list validation (`claude plugin install`, `claude plugin list`) when command exists.
- Required fallback validation using `claude --plugin-dir <dir> plugin list`.
- Plugin name appears in list output.

Script:

- `scripts/verify-load.sh`

## Level 4: CI Parity Validation

Goal: reproduce CI smoke test locally.

Checks:

- Build `integration_tests/Dockerfile`.
- Run container and ensure smoke checks pass.

Script:

- `scripts/verify-ci.sh`

## Execution Order

Run `scripts/verify-all.sh` for complete validation in strict order: L1 -> L2 -> L3 -> L4.
