# Contributing

Thanks for contributing to this template.

## Development Prerequisites

- `git`
- `docker`
- `trunk` CLI
- Optional: `claude` CLI (`npm install -g @anthropic-ai/claude-code`) for full plugin loading checks

## Setup

1. Fork or branch from this repository.
2. Install Trunk:
   - `curl https://get.trunk.io -fsSL | bash`
3. Verify tools:
   - `trunk --version`
   - `docker --version`

## Local Checks

Run these before opening a pull request:

1. `make format`
2. `make lint`
3. `make test-integration-docker`

You can also run integration scripts directly:

- `./integration_tests/validate-manifest.sh`
- `./integration_tests/run.sh --verbose`

## Adding or Updating Plugin Components

- Skills:
  - Add under `skills/<skill-name>/SKILL.md`
  - Keep instructions specific, testable, and deterministic
- Agents:
  - Add Markdown files under `agents/`
  - Include front matter (`name`, `description`) and clear behavior
- Hooks:
  - Update `hooks/hooks.json`
  - Keep JSON valid and minimal
- Commands:
  - Add command definitions under `commands/` as needed

## Pull Request Guidelines

1. Keep changes scoped and focused.
2. Update docs when behavior or structure changes.
3. Include test evidence in your PR description (commands run and outcomes).
4. Ensure CI passes (`trunk_check` and `integration_tests` workflows).

## Commit Guidelines

- Use clear, imperative commit messages.
- Prefer small commits that are easy to review.

## Reporting Issues

Open an issue with:

- expected behavior
- actual behavior
- reproduction steps
- logs or screenshots when relevant
