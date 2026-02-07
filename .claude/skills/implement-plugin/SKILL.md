---
name: implement-plugin
description: Package and distribute Claude Code plugins with schema-safe manifests, canonical layout, component wiring, and release-ready validation.
---

# Implement Plugin

Implement plugin-level packaging, manifest wiring, structure checks, runtime load checks, and distribution guidance.

## Workflow

1. Define plugin metadata and distribution scope.
2. Update `.claude-plugin/plugin.json` and component path mappings.
3. Validate manifest and directory structure.
4. Verify runtime load with `--plugin-dir` and optional install flow.
5. Run CI-parity smoke tests before distribution.

## Progressive Disclosure

- Manifest schema and field rules: `references/manifest-schema.md`
- Directory conventions and anti-patterns: `references/directory-structure.md`
- Test strategy across local/CI: `references/testing-strategies.md`
- Distribution checklist and channels: `references/plugin-distribution.md`
- Scope and install context guidance: `references/plugin-scopes.md`

- Manifest validator: `scripts/validate-manifest.sh`
- Layout validator: `scripts/check-structure.sh`
- Runtime load check: `scripts/test-plugin-load.sh`

- Minimal manifest template: `assets/templates/minimal-plugin.json`
- Complete manifest template: `assets/templates/complete-plugin.json`
- Manifest with components template: `assets/templates/plugin-with-components.json`

## Component Skills

- Hooks: `../implement-hooks/SKILL.md`
- Agent Skills: `../implement-agent-skills/SKILL.md`
- Sub-Agents: `../implement-sub-agents/SKILL.md`
- Agent Teams: `../implement-agent-teams/SKILL.md`
- Umbrella selection guide: `../implement-claude-extensions/SKILL.md`

## Sources

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference
