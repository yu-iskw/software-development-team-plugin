# Claude Plugin Template

Template repository for bootstrapping a Claude Code plugin with:

- plugin manifest (`.claude-plugin/plugin.json`)
- skills (`skills/**/SKILL.md`)
- agents (`agents/*.md`)
- hooks (`hooks/hooks.json`)
- quality checks (`trunk` + GitHub Actions)
- integration smoke tests (`integration_tests/`)

## Quickstart

1. Create a new repository from this template.
2. Update `.claude-plugin/plugin.json` (`name`, `version`, `description`, `author`, `repository`).
3. Replace sample components with your own:
   - `skills/hello-world/SKILL.md`
   - `agents/say-hello-agent.md`
   - `hooks/hooks.json`
4. Run local checks:
   - `make lint`
   - `make test-integration-docker`

## Repository Layout

```text
.claude-plugin/
  plugin.json                    # Claude plugin metadata
agents/
  say-hello-agent.md             # Example agent
commands/
  .gitkeep                       # Optional command definitions
hooks/
  hooks.json                     # Hook config
integration_tests/
  Dockerfile                     # Smoke test image
  run.sh                         # Orchestrates integration scripts
  validate-manifest.sh
  test-plugin-loading.sh
  test-component-discovery.sh
skills/
  hello-world/
    SKILL.md                     # Example skill
.github/workflows/
  integration_tests.yml          # Plugin smoke tests
  trunk_check.yml                # Lint checks
  trunk_upgrade.yml              # Scheduled Trunk upgrades
```

## Local Development

- `make format`: format files with Trunk
- `make lint`: run all linters via Trunk
- `make test-integration-docker`: run integration tests in Docker

You can also run integration tests directly:

- `./integration_tests/run.sh`
- `./integration_tests/run.sh --manifest-only`
- `./integration_tests/run.sh --verbose`

## CI

GitHub Actions includes:

- `.github/workflows/trunk_check.yml`: lint and static checks
- `.github/workflows/integration_tests.yml`: manifest validation and plugin loading smoke tests
- `.github/workflows/trunk_upgrade.yml`: weekly Trunk dependency updates

## Release

1. Update `.claude-plugin/plugin.json` version.
2. Tag and publish a release.
3. Share your repository as the plugin entry point/template.

## License

Apache License 2.0. See `LICENSE`.
