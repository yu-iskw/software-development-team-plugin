---
name: implement-claude-extensions
description: Choose and implement the right Claude extension type by comparing hooks, skills, sub-agents, agent teams, and plugin packaging patterns.
---

# Implement Claude Extensions

Use this umbrella skill to choose the correct extension type and route implementation to the appropriate component skill.

## Comparison

| Extension Type | Best For                           | Primary Artifacts                | Component Skill                      |
| -------------- | ---------------------------------- | -------------------------------- | ------------------------------------ |
| Hooks          | Event-driven automation/guardrails | `hooks/hooks.json`, hook scripts | `../implement-hooks/SKILL.md`        |
| Agent Skills   | Reusable task playbooks            | `skills/<name>/SKILL.md`         | `../implement-agent-skills/SKILL.md` |
| Sub-Agents     | Specialized delegated roles        | `agents/*.md`                    | `../implement-sub-agents/SKILL.md`   |
| Agent Teams    | Coordinated multi-agent execution  | team config + coordination docs  | `../implement-agent-teams/SKILL.md`  |
| Plugins        | Packaging/distribution + wiring    | `.claude-plugin/plugin.json`     | `../implement-plugin/SKILL.md`       |

## Workflow

1. Identify outcome and constraints.
2. Use `references/when-to-use.md` to pick extension type(s).
3. Hand off implementation to component skill(s).
4. Apply shared lifecycle checks before verification.

## Progressive Disclosure

- Extension comparison details: `references/extension-types.md`
- Decision guide: `references/when-to-use.md`
- Cross-component patterns: `references/cross-component-patterns.md`
- Lifecycle from design to verification: `references/extension-lifecycle.md`

## Component Skills

- `../implement-hooks/SKILL.md`
- `../implement-agent-skills/SKILL.md`
- `../implement-sub-agents/SKILL.md`
- `../implement-agent-teams/SKILL.md`
- `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/agent-teams
- https://code.claude.com/docs/en/hooks-guide
