# Hook Types

## Command Hooks

- Execute a shell command/script.
- Use absolute plugin-root-safe paths via `${CLAUDE_PLUGIN_ROOT}`.
- Ensure scripts are executable and fail fast with non-zero exit codes.

## Prompt Hooks

- Use structured prompt transforms or checks before continuation.
- Keep transformation deterministic and reversible where possible.

## Agent Hooks

- Trigger specialized handling tied to agent workflows.
- Use clear boundaries to avoid recursive or overlapping behavior.

## Source

- https://code.claude.com/docs/en/hooks-guide
