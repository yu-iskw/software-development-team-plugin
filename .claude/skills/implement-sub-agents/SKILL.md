---
name: implement-sub-agents
description: Create and validate Claude sub-agent definitions with correct frontmatter, tool permissions, and delegation boundaries.
---

# Implement Sub-Agents

Create or update agent files under `agents/` with explicit role boundaries, model/tool settings, and delegation patterns.

## Workflow

1. Define the sub-agent role and scope boundaries.
2. Author/update agent markdown with valid frontmatter.
3. Set tool/model/permission configuration based on least privilege.
4. Validate frontmatter and basic agent file shape.
5. Connect with related skills/hooks only when required.

## Progressive Disclosure

- Agent frontmatter rules: `references/subagent-frontmatter.md`
- Tool access strategy: `references/subagent-tools.md`
- Model selection guidance: `references/subagent-models.md`
- Permission boundaries: `references/subagent-permissions.md`
- Delegation patterns: `references/subagent-delegation.md`

- Agent file validator: `scripts/validate-subagent.sh`
- Frontmatter checker: `scripts/check-subagent-frontmatter.sh`

- Base sub-agent template: `assets/templates/subagent-template.md`
- Read-only sub-agent example: `assets/templates/subagent-readonly.md`
- Sub-agent with skills example: `assets/templates/subagent-with-skills.md`
- Sub-agent with hooks example: `assets/templates/subagent-with-hooks.md`

## Related Skills

- Umbrella routing and architecture: `../implement-claude-extensions/SKILL.md`
- Agent team coordination: `../implement-agent-teams/SKILL.md`

## Sources

- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/plugins
