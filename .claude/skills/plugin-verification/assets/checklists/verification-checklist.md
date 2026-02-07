# Plugin Verification Checklist

1. Confirm `.claude-plugin/plugin.json` exists and parses.
2. Validate required fields: `name`, `version`, `description`.
3. Confirm plugin name matches kebab-case regex `^[a-z0-9-]+$`.
4. Confirm required directories at root: `skills/`, `agents/`, `hooks/`.
5. Confirm `hooks/hooks.json` exists.
6. Confirm each skill directory contains `SKILL.md`.
7. Run `scripts/verify-manifest.sh`.
8. Run `scripts/verify-structure.sh`.
9. Run `scripts/verify-load.sh`.
10. Run `scripts/verify-ci.sh`.
11. Run `scripts/verify-all.sh` before push.
