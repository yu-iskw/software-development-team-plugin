# Directory Structure Patterns

References:

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference

## Canonical Layout

```text
my-plugin/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   └── my-skill/
│       └── SKILL.md
├── agents/
│   └── researcher.md
├── hooks/
│   └── hooks.json
├── commands/          # optional / legacy-style commands
├── .mcp.json          # optional
└── .lsp.json          # optional
```

## Rules

- Only `plugin.json` belongs in `.claude-plugin/`.
- `skills/`, `agents/`, `hooks/`, and `commands/` are plugin-root directories.
- Each skill must be `skills/<skill-name>/SKILL.md`.
- Hook registry default is `hooks/hooks.json`.
- Agent files are markdown files under `agents/`.

## Common Mistakes

- Putting `skills/`, `agents/`, `hooks/`, or `commands/` inside `.claude-plugin/`.
- Creating `skills/<name>.md` instead of `skills/<name>/SKILL.md`.
- Naming the skill file `skill.md` or `README.md` instead of `SKILL.md`.
- Defining absolute paths in manifest path fields.
- Using path fields without `./` prefix.

## Fast Checks

- Run `scripts/check-structure.sh` for layout validation.
- Run `scripts/test-plugin-load.sh` to confirm components are visible to Claude.
