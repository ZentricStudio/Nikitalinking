# Setting up a NEW machine (e.g. the new MacBook)

Goal: the new machine ends up with the **same Claude account** and **all the
skills, commands, memory, and settings** — everything you have now.

There are two halves, and you want both:

- **A. Save the current machine** (do this first, on the OLD machine).
- **B. Restore onto the new machine.**

---

## Before you start

The **Claude account** (your Anthropic login) is not stored in GitHub — you just
sign in with the same email on the new machine. This repo restores everything
*around* it: skills, commands, agents, memory, and settings.

You need [Claude Code](https://claude.ai/code) installed and `git` available on
the new machine.

---

## A. On the OLD machine — save everything (5 min)

1. Open a terminal and get the repo (skip the clone if you already have it):
   ```
   git clone https://github.com/ZentricStudio/claude-hub.git
   cd claude-hub
   ```
2. Save this machine's Claude setup into the repo and push it:
   ```
   bash scripts/backup.sh
   ```
   This copies your `~/.claude` skills / commands / agents into the repo,
   commits, and pushes. Now everything is safely in GitHub.

> If `backup.sh` mentions `settings.backup.json`, open it and check there are no
> API keys before sharing any of it. It's gitignored by default, so it won't be
> pushed unless you deliberately move values into `settings.example.json`.

---

## B. On the NEW MacBook — restore everything (5 min)

1. **Sign in to Claude** with the same account (same email as now).
2. Get the repo:
   ```
   git clone https://github.com/ZentricStudio/claude-hub.git
   cd claude-hub
   ```
   (Because the repo is private, sign in to GitHub with an account that has
   access — the owner account, or one invited as a collaborator.)
3. Restore your environment:
   ```
   bash scripts/install.sh
   ```
   This links your skills / commands / agents into `~/.claude` and wires up the
   shared memory.
4. Open Claude Code and pull in the shared team library:
   ```
   /plugin marketplace add ZentricStudio/claude-hub
   /plugin install shared-library@zentric-hub
   ```

Done. The new MacBook now has your environment **and** the group's shared tools.

---

## Keeping machines in sync afterwards

- After you add or change anything: `bash scripts/backup.sh` (pushes it up).
- On any other machine: `bash scripts/update.sh` (pulls it down), then
  `/plugin marketplace update zentric-hub` inside Claude Code.
