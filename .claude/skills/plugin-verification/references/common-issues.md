# Common Verification Issues

## Manifest Issues

- `Invalid JSON structure`:
  - Cause: trailing commas or malformed JSON.
  - Fix: run `jq . .claude-plugin/plugin.json` and correct syntax.

- `Missing required non-empty string field`:
  - Cause: `name`, `version`, or `description` missing/empty.
  - Fix: populate all fields with non-empty strings.

- `Invalid plugin name ... Expected kebab-case`:
  - Cause: uppercase letters, spaces, underscores.
  - Fix: rename to lower-case kebab-case, for example `my-plugin`.

## Structure Issues

- `Misplaced 'skills/' under .claude-plugin/`:
  - Cause: component directories placed in config directory.
  - Fix: move to plugin root.

- `Skill ... is missing SKILL.md`:
  - Cause: wrong file name (`skill.md`, `README.md`) or missing file.
  - Fix: use exact path `skills/<name>/SKILL.md`.

- `Missing hooks/hooks.json`:
  - Cause: hooks directory exists without registry file.
  - Fix: create `hooks/hooks.json` with at least `{ "version": "1", "hooks": [] }`.

## Load Issues

- `claude CLI is not available in PATH`:
  - Fix: install/update Claude CLI and retry.

- Plugin absent from `plugin list` output:
  - Cause: install failure, wrong manifest name, or wrong plugin dir path.
  - Fix: rerun with explicit plugin path and inspect script output files.

## Docker/CI Issues

- Docker build fails on `jq` step:
  - Cause: manifest validation failure.
  - Fix: rerun Level 1 locally, then rebuild image.

- Local pass but CI fail:
  - Cause: environment differences or stale CLI.
  - Fix: verify Node/CLI versions and rerun all levels in clean shell.
