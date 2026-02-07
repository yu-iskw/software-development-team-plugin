# Plugin Manifest Schema (`.claude-plugin/plugin.json`)

Authoritative references:

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference

## Summary

- Manifest is optional, but recommended for metadata and custom component paths.
- If manifest is present, official schema requires `name`.
- This repository's CI additionally enforces non-empty `name`, `version`, and `description`.

## Complete Schema (From Plugins Reference)

```json
{
  "name": "plugin-name",
  "version": "1.2.0",
  "description": "Brief plugin description",
  "author": {
    "name": "Author Name",
    "email": "author@example.com",
    "url": "https://github.com/author"
  },
  "homepage": "https://docs.example.com/plugin",
  "repository": "https://github.com/author/plugin",
  "license": "MIT",
  "keywords": ["keyword1", "keyword2"],
  "commands": ["./custom/commands/special.md"],
  "agents": "./custom/agents/",
  "skills": "./custom/skills/",
  "hooks": "./config/hooks.json",
  "mcpServers": "./mcp-config.json",
  "outputStyles": "./styles/",
  "lspServers": "./.lsp.json"
}
```

## Field Reference

Required by official schema when manifest exists:

- `name` (string): kebab-case plugin identifier, used as namespace prefix.

Metadata fields (optional):

- `version` (string): semantic version.
- `description` (string): plugin summary.
- `author` (object): author metadata (commonly `name`, optional `email`, `url`).
- `homepage` (string): docs URL.
- `repository` (string): source URL.
- `license` (string): SPDX-style identifier (for example `MIT`, `Apache-2.0`).
- `keywords` (array of strings): discovery tags.

Component path fields (optional):

- `commands` (string | array): command files/directories.
- `agents` (string | array): agent markdown files/directories.
- `skills` (string | array): skill directories.
- `hooks` (string | array | object): hook file paths or inline config.
- `mcpServers` (string | array | object): MCP file paths or inline config.
- `outputStyles` (string | array): output style files/directories.
- `lspServers` (string | array | object): LSP file paths or inline config.

## Validation Rules

Official rules:

- All custom paths are relative to plugin root and start with `./`.
- Custom paths supplement default locations; they do not replace defaults.
- Do not place component directories inside `.claude-plugin/`.

Template CI rules in this repository (`integration_tests/Dockerfile`, `.github/workflows/integration_tests.yml`):

- Manifest JSON must parse successfully.
- `name`, `version`, `description` must be non-empty strings.
- `name` must match `^[a-z0-9-]+$`.

## Minimal Valid Examples

Official-minimal (schema):

```json
{
  "name": "my-plugin"
}
```

Template-minimal (CI-compliant):

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "My plugin description"
}
```
