# Testing Strategies

References:

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference

## 1) Local Manifest + Structure Checks

Run from plugin root:

```bash
.claude/skills/plugin-implementation-deprecated/scripts/validate-manifest.sh
.claude/skills/plugin-implementation-deprecated/scripts/check-structure.sh
```

## 2) Runtime Load Check with `--plugin-dir`

```bash
.claude/skills/plugin-implementation-deprecated/scripts/test-plugin-load.sh .
```

This mirrors CI fallback behavior by validating plugin visibility in `claude --plugin-dir <dir> plugin list`.

## 3) Docker Smoke Test (Matches `integration_tests/Dockerfile`)

```bash
docker build -f integration_tests/Dockerfile -t plugin-smoke .
docker run --rm plugin-smoke
```

## 4) CI Integration Pattern

Current workflow (`.github/workflows/integration_tests.yml`) validates:

- JSON parse + manifest field checks
- Plugin install/load via CLI when available
- `--plugin-dir` visibility fallback
- Docker smoke test job

Recommended local sequence before push:

1. `validate-manifest.sh`
2. `check-structure.sh`
3. `test-plugin-load.sh`
4. Docker smoke test
