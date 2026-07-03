# How it works

The mental model, in plain terms.

## Two mechanisms, one repo

### 1. The marketplace (links *people*)

`.claude-plugin/marketplace.json` turns this repo into a **Claude Code plugin
marketplace**. When someone runs `/plugin marketplace add ZentricStudio/claude-hub`
and installs `shared-library`, Claude Code reads the skills, commands, and agents
under `plugins/shared-library/` and makes them part of that person's Claude.

- Add a skill to `plugins/shared-library/skills/` → push → everyone runs
  `/plugin marketplace update zentric-hub` → everyone has it.
- This is how "we all benefit from each other" actually happens.

### 2. The backup scripts (link *machines*)

`~/.claude` is where Claude Code stores your setup on a computer. The scripts
move it in and out of this repo:

- `scripts/backup.sh` copies `~/.claude` → `home-claude/` and pushes.
- `scripts/install.sh` links `home-claude/` → `~/.claude` on a new machine.

So a new machine, after one script, has your skills, commands, agents, memory,
and a settings reference — identical to where you left off.

## What is NOT stored here

- **Your Claude account / login.** That's your Anthropic account — you sign in
  with it on each machine. The repo restores everything *around* it.
- **Secrets.** API keys, tokens, passwords. Never commit them, even though the
  repo is private. `.gitignore` blocks the usual suspects, but stay careful.

## Why a plugin marketplace instead of just copying files?

Because it updates cleanly. Everyone installs once, then `/plugin marketplace
update` pulls new shared tools without anyone hand-copying folders or clobbering
their own setup. The backup scripts cover the personal, machine-level stuff the
marketplace doesn't.
