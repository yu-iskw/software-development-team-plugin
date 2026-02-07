# Component Patterns

References:

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference

## Skills (`skills/<name>/SKILL.md`)

Best practices:

- Include frontmatter with at least `name` and `description`.
- Keep instructions task-specific and deterministic.
- Use progressive disclosure: link to local references/scripts from `SKILL.md`.

Example:

```md
---
name: code-review
description: Review code changes for correctness and risk.
---

Review the diff for bugs and regressions. Prioritize concrete findings.
```

## Agents (`agents/*.md`)

Best practices:

- One role per file.
- Clear sections: role, responsibilities, outputs.
- Avoid vague process language; define deliverable format.

Example shape:

- `# Agent Name`
- `## Role`
- `## Responsibilities`
- `## Deliverable Format`

## Hooks (`hooks/hooks.json`)

Best practices:

- Keep hook config in JSON, scripts in `scripts/`.
- Mark shell scripts executable.
- Use `${CLAUDE_PLUGIN_ROOT}` for robust paths.

Example command hook snippet:

```json
{
  "version": "1",
  "hooks": [
    {
      "event": "PostToolUse",
      "hooks": [
        {
          "type": "command",
          "command": "${CLAUDE_PLUGIN_ROOT}/scripts/post-tool.sh"
        }
      ]
    }
  ]
}
```

## MCP Servers (`.mcp.json` or `plugin.json#mcpServers`)

Best practices:

- Keep server paths relative and portable.
- Prefer `${CLAUDE_PLUGIN_ROOT}` in command paths.
- Verify server command exists before distribution.

## LSP Servers (`.lsp.json` or `plugin.json#lspServers`)

Best practices:

- Use language-specific server binaries available in `PATH`.
- Provide `extensionToLanguage` for file mapping.
- Document install requirements in `README.md`.
