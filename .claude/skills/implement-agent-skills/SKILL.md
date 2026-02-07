---
name: implement-agent-skills
description: Implement and maintain Claude Agent Skills with valid SKILL.md frontmatter, focused instructions, and progressive disclosure.
---

# Implement Agent Skills

Create or update `skills/<skill-name>/SKILL.md` files with deterministic scope and reusable references/scripts/templates.

## Workflow

1. Define a single-purpose skill objective and trigger criteria.
2. Create/update `skills/<name>/SKILL.md` with valid frontmatter.
3. Add focused references/scripts/templates for progressive disclosure.
4. Validate frontmatter and skill directory structure.
5. Cross-link to plugin packaging or umbrella guidance as needed.

## Progressive Disclosure

- Skill directory conventions: `references/skill-structure.md`
- Required frontmatter fields: `references/skill-frontmatter.md`
- Progressive disclosure patterns: `references/skill-progressive-disclosure.md`
- Invocation and trigger guidance: `references/skill-invocation.md`

- Structure validator: `scripts/validate-skill-structure.sh`
- Frontmatter checker: `scripts/check-skill-frontmatter.sh`

- Base skill template: `assets/templates/skill-template.md`
- Skill with references example: `assets/templates/skill-with-references.md`
- Skill with scripts example: `assets/templates/skill-with-scripts.md`

## Related Skills

- Umbrella routing and component selection: `../implement-claude-extensions/SKILL.md`
- Plugin packaging/distribution: `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/plugins
