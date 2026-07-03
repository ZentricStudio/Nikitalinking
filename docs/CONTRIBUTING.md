# Contributing to the shared library

Everything you add becomes available to everyone once they update the
marketplace. Keep it simple and it stays useful.

## Add a skill (a reusable capability)

1. Copy `plugins/shared-library/skills/example-hello/` to
   `plugins/shared-library/skills/<your-skill-name>/`.
2. Edit `SKILL.md`:
   - `name:` must match the folder name (kebab-case).
   - `description:` one or two sentences describing **when** Claude should use it.
     This is the most important line — it's how Claude decides to trigger it.
   - Below the frontmatter, write the instructions Claude follows.
3. Commit and push.

## Add a slash command

1. Copy `plugins/shared-library/commands/example.md` to
   `plugins/shared-library/commands/<name>.md`. The filename becomes `/<name>`.
2. Edit the `description` and the body.
3. Commit and push.

## Add a subagent

Drop a `<name>.md` file into `plugins/shared-library/agents/`.

## Add shared knowledge

Edit `home-claude/CLAUDE.md`. Anything there is memory the whole group shares.

## After pushing

Tell the group to run:

```
/plugin marketplace update zentric-hub
```

so they pick up your changes.

## Rules of thumb

- One skill / command = one clear job. Small and specific beats big and vague.
- Write good `description` lines — they decide whether Claude actually uses the thing.
- **Never commit secrets**, even in a private repo.
