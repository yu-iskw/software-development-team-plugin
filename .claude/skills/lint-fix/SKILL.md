---
name: lint-fix
description: Run formatting and linting via Makefile (make format, make lint).
---

# Lint Fix

Run formatting and lint checks using the project Makefile.

## Workflow

1. Run `make format` to format code.
2. Run `make lint` to check for violations.
3. Address any remaining lint failures manually if needed.

## Usage

When lint or format issues are detected or when you need to ensure code quality:

- Run `make format` then `make lint`.

## Progressive Disclosure

- Makefile target definitions: [Makefile](../../../Makefile) at repo root.

## Related Skills

- Plugin verification: `../plugin-verification/SKILL.md`
- Agent skills implementation: `../implement-agent-skills/SKILL.md`

## Sources

- https://docs.trunk.io/check
- https://docs.trunk.io/code-quality/linters/run-linters
