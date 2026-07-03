# home-claude — your portable Claude environment

This folder mirrors `~/.claude` — the config folder Claude Code keeps on your
machine. It's what makes moving to a new computer painless.

| Here | Maps to | Holds |
|------|---------|-------|
| `home-claude/skills/` | `~/.claude/skills/` | your global skills |
| `home-claude/commands/` | `~/.claude/commands/` | your global slash commands |
| `home-claude/agents/` | `~/.claude/agents/` | your global subagents |
| `home-claude/CLAUDE.md` | imported into `~/.claude/CLAUDE.md` | shared team memory |
| `home-claude/settings.example.json` | reference for `~/.claude/settings.json` | shared settings (no secrets) |

**Save this machine's setup here:** `bash scripts/backup.sh`
**Restore it on another machine:** `bash scripts/install.sh`

> Shared *team* skills/commands that everyone should get are better kept in
> `plugins/shared-library/` and installed via the marketplace. Use `home-claude/`
> for your own global setup and the shared memory/settings.
