# Claude Plugin CLI Commands

References:

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference

## Common Commands

- `claude plugin list`
  - List installed/discovered plugins.

- `claude plugin install --scope project <plugin-path-or-repo>`
  - Install a plugin into project scope.

- `claude plugin install --scope user <plugin-path-or-repo>`
  - Install into user scope.

- `claude --plugin-dir <plugin-root> plugin list`
  - Discover plugin directly from a local directory (best fallback for template verification).

## Validation-Oriented Command Sequence

```bash
claude plugin install --scope project .
claude plugin list
claude --plugin-dir . plugin list
```

## Notes

- Command availability can vary by CLI version. Scripts check support before relying on install flows.
- For command options and latest subcommands, run:

```bash
claude plugin --help
claude plugin install --help
```
