# Hook Events

Use event hooks to run logic around Claude execution lifecycle.

## Typical Events

- `PreToolUse`: run checks before a tool executes.
- `PostToolUse`: run actions after a tool executes.
- `UserPromptSubmit`: inspect or log prompt submissions.
- `SessionStart` / `SessionEnd`: session lifecycle integration.

Select the smallest event scope that satisfies the requirement.

## Design Guidance

- Prefer `PostToolUse` for logging/metrics to avoid blocking execution.
- Use `PreToolUse` only when guardrails must block risky actions.
- Keep handler side effects explicit and idempotent when possible.

## Source

- https://code.claude.com/docs/en/hooks-guide
