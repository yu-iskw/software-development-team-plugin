---
name: implement-hooks
description: Implement and validate Claude Code hook configurations and hook scripts for command, prompt, and agent workflows.
---

# Implement Hooks

Build or update `hooks/hooks.json` and related script handlers with deterministic validation.

## Workflow

1. Identify required hook event(s), matcher(s), and hook type(s).
2. Implement `hooks/hooks.json` using stable `${CLAUDE_PLUGIN_ROOT}` paths.
3. Add or update hook handler scripts and mark them executable.
4. Run hook validation and script smoke tests.
5. Verify plugin-level integration from `implement-plugin` and cross-check in `plugin-verification`.

## Progressive Disclosure

- Event model and usage: `references/hook-events.md`
- Hook types and payload shape: `references/hook-types.md`
- Matcher patterns and filtering: `references/hook-matchers.md`
- Hook file placement and path rules: `references/hook-location.md`

- Hook config validation: `scripts/validate-hooks.sh`
- Hook script smoke test: `scripts/test-hook-script.sh`

- Base hooks template: `assets/templates/hooks-template.json`
- Command hook example: `assets/templates/command-hook-example.sh`
- Prompt hook example: `assets/templates/prompt-hook-example.json`
- Agent hook example: `assets/templates/agent-hook-example.json`

## Related Skills

- Umbrella routing and tradeoffs: `../implement-claude-extensions/SKILL.md`
- Plugin packaging and manifest wiring: `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/hooks-guide
- https://code.claude.com/docs/en/plugins
