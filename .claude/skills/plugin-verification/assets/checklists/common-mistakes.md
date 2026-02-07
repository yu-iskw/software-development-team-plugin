# Common Structural Mistakes (Visual Guide)

## Wrong

```text
.claude-plugin/
  plugin.json
  skills/            # WRONG: misplaced
skills/
  my-skill.md        # WRONG: should be skills/my-skill/SKILL.md
agents/
  researcher.txt     # WRONG: should be markdown
hooks/
  config.json        # WRONG: expected hooks/hooks.json by default
```

## Right

```text
.claude-plugin/
  plugin.json
skills/
  my-skill/
    SKILL.md
agents/
  researcher.md
hooks/
  hooks.json
```

## Quick Fixes

- Move component directories out of `.claude-plugin/` to plugin root.
- Rename `skills/<name>.md` to `skills/<name>/SKILL.md`.
- Convert agent files to `.md`.
- Add `hooks/hooks.json` and keep hook scripts under `scripts/`.
