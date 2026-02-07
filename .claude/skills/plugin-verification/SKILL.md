---
name: plugin-verification
description: Verify Claude extensions and plugins across hooks, skills, sub-agents, teams, manifest, structure, runtime loading, and CI parity.
---

# Plugin Verification

Run layered verification for extension components and plugin packaging before CI and release.

## Validation Levels

1. Component-level verification (hooks, skills, sub-agents, teams).
2. Manifest JSON + schema checks.
3. Directory and file layout checks.
4. CLI load and visibility checks.
5. Docker smoke-test parity with CI.

## Progressive Disclosure

- Validation level model: `references/validation-levels.md`
- Troubleshooting guide: `references/common-issues.md`
- CLI command reference: `references/cli-commands.md`
- CI/CD alignment: `references/ci-integration.md`
- Hook verification guidance: `references/verify-hooks.md`
- Skill verification guidance: `references/verify-skills.md`
- Sub-agent verification guidance: `references/verify-subagents.md`
- Team verification guidance: `references/verify-teams.md`

- Level 2 script: `scripts/verify-manifest.sh`
- Level 3 script: `scripts/verify-structure.sh`
- Level 4 script: `scripts/verify-load.sh`
- Level 5 script: `scripts/verify-ci.sh`
- All levels: `scripts/verify-all.sh`

- Checklist: `assets/checklists/verification-checklist.md`
- Mistake guide: `assets/checklists/common-mistakes.md`

## Related Skills

- Umbrella guide: `../implement-claude-extensions/SKILL.md`
- Hooks implementation: `../implement-hooks/SKILL.md`
- Agent Skills implementation: `../implement-agent-skills/SKILL.md`
- Sub-Agent implementation: `../implement-sub-agents/SKILL.md`
- Agent Team implementation: `../implement-agent-teams/SKILL.md`
- Plugin packaging: `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/agent-teams
- https://code.claude.com/docs/en/hooks-guide
