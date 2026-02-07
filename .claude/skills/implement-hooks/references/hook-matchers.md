# Hook Matchers

Use matchers to scope hooks to relevant operations.

## Best Practices

- Start with specific matchers and widen only when needed.
- Avoid broad global matchers that create noisy triggers.
- Keep matcher intent documented near the hook entry.

## Reliability Tips

- Validate matcher patterns against representative inputs.
- Add a minimal smoke test script for each new matcher shape.
- Combine matchers with event-level scoping for precision.

## Source

- https://code.claude.com/docs/en/hooks-guide
