# claude-hub

**One private hub that links everyone's Claude Code together — and travels with you to any machine.**

Instead of each person's Claude knowing different things and having different
tools, we keep it all here. Anyone adds a skill, command, or note; everyone's
Claude gets it. And because it all lives in one repo, moving to a **new
computer** is just: sign in, clone, run one script — and your whole Claude setup
is back.

This repo does two jobs:

1. **Links people** — a shared *plugin marketplace* everyone installs once, so
   skills/commands/agents made by any of us show up for all of us.
2. **Travels between machines** — a backup of your Claude environment
   (skills, commands, agents, memory, settings) plus scripts to restore it on a
   new machine in one step.

---

## The map

| Path | What it is |
|------|-----------|
| `plugins/shared-library/` | **Shared** skills / commands / agents — the stuff everyone gets |
| `home-claude/` | A **backup of `~/.claude`** — your portable environment (memory, settings, personal skills) |
| `scripts/install.sh` | Restore everything onto a machine |
| `scripts/backup.sh` | Save this machine's Claude setup into the repo |
| `scripts/update.sh` | Pull the latest and refresh |
| `people/` | A small space per person/machine that's linked |
| `docs/` | Step-by-step guides (start with `docs/NEW-MACHINE.md`) |
| `.claude-plugin/marketplace.json` | The marketplace manifest that makes linking work |

---

## Quick start

**If you're setting up a NEW machine (e.g. the new MacBook):**
→ Follow **[`docs/NEW-MACHINE.md`](docs/NEW-MACHINE.md)**. That's the one.

**If you're a person linking in for the first time:**
→ Follow **[`docs/LINKING.md`](docs/LINKING.md)**.

**The 30-second version — link your Claude to the group:**

```
/plugin marketplace add ZentricStudio/claude-hub
/plugin install shared-library@zentric-hub
```

**Pull everyone's latest additions anytime:**

```
/plugin marketplace update zentric-hub
```

---

## Who's linked

| Person | Their space |
|--------|-------------|
| ZentricStudio (owner) | `people/zentric/` |
| Sam | `people/sam/` |
| Sam's uncle | `people/sams-uncle/` |

Add a row when someone new links in.

---

## How it works (short version)

- Shared tools live in `plugins/shared-library/`. Claude Code's plugin system
  pulls them into each linked Claude. Add one → everyone gets it after
  `/plugin marketplace update`.
- Your personal machine setup (global memory, settings, personal skills) is
  backed up into `home-claude/` by `scripts/backup.sh`, and restored by
  `scripts/install.sh`. That's what makes a new machine feel identical.
- The **Claude account itself** (your Anthropic login) isn't stored here — you
  sign in with it on the new machine. This repo restores everything *around* it:
  the skills, tools, memory, and settings.

Full explanation in [`docs/HOW-IT-WORKS.md`](docs/HOW-IT-WORKS.md).

---

## Golden rules

- **Never commit secrets** — no API keys, tokens, or passwords. This repo is
  private, but treat it like it isn't.
- **Small and specific beats big and vague** — one skill = one job.
- **After you push, tell the group** to run `/plugin marketplace update zentric-hub`.
