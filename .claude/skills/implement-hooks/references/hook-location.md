# Hook File Location

## Canonical Placement

- Registry file: `hooks/hooks.json`
- Script handlers: plugin-root scripts directory (for example `scripts/`)

## Path Rules

- Keep hook configuration in JSON.
- Reference scripts with `${CLAUDE_PLUGIN_ROOT}/...`.
- Mark shell handlers executable.

## Source

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/hooks-guide
