# CI Integration Mapping

References:

- `.github/workflows/integration_tests.yml`
- `integration_tests/Dockerfile`

## How Local Verification Maps to CI

- Level 1 (`verify-manifest.sh`): mirrors JSON + required field checks in CI and Docker smoke test.
- Level 2 (`verify-structure.sh`): adds structural guardrails to catch common repository mistakes pre-CI.
- Level 3 (`verify-load.sh`): mirrors plugin install/list checks and `--plugin-dir` fallback from CI workflow.
- Level 4 (`verify-ci.sh`): executes exact Docker smoke test path used in CI.

## Recommended Pre-Push Gate

```bash
.claude/skills/plugin-verification/scripts/verify-all.sh
```

## CI Alignment Tips

- Keep `plugin.json` validation logic synchronized with workflow and Dockerfile.
- Prefer deterministic shell scripts with `set -euo pipefail`.
- Emit actionable error messages with failing path and reason.
