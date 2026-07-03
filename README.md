# Nikitalinking

A **private, shared library** that links everyone's Claude Code together.

The idea: instead of each of us building skills, commands, and tools in our own
Claude in isolation, we pool them here. Anyone can add something, and once it's
here **everyone's Claude gets it** — so we all benefit from each other's work.

This repo is set up as a **Claude Code plugin marketplace**. You add it once, and
from then on every shared skill/command/agent shows up in your Claude.

---

## Who's linked

- ZentricStudio (owner)
- Sam
- Sam's uncle

## What's in here

| Folder | What it holds |
|--------|---------------|
| `.claude-plugin/marketplace.json` | The marketplace manifest (don't need to touch this often) |
| `plugins/shared-library/skills/` | Shared **skills** — reusable capabilities Claude can use |
| `plugins/shared-library/commands/` | Shared **slash commands** (`/name`) |
| `plugins/shared-library/agents/` | Shared **subagents** |
| `shared-context/CLAUDE.md` | Shared **knowledge** every Claude can read |

---

## One-time setup for each person

Do this once, in Claude Code, on each person's machine:

### 1. Add the marketplace

```
/plugin marketplace add ZentricStudio/Nikitalinking
```

(Because the repo is **private**, your Claude Code / git needs to be signed in to
a GitHub account that has access to the repo — see "Getting access" below.)

### 2. Install the shared library

```
/plugin install shared-library@nikita-linking
```

That's it. You now have everyone's shared skills and commands.

### 3. Pull updates whenever someone adds something

```
/plugin marketplace update nikita-linking
```

Run that any time you want the latest contributions from the group.

---

## Adding your own library (so others benefit)

1. Clone the repo (or work in it directly):
   ```
   git clone https://github.com/ZentricStudio/Nikitalinking.git
   ```
2. Add a **skill**: copy `plugins/shared-library/skills/example-hello/` to a new
   folder and edit its `SKILL.md`.
   Add a **command**: copy `plugins/shared-library/commands/example.md` to
   `commands/your-name.md`.
   Add shared **knowledge**: edit `shared-context/CLAUDE.md`.
3. Commit and push:
   ```
   git add -A && git commit -m "Add <thing>" && git push
   ```
4. Tell the others to run `/plugin marketplace update nikita-linking`.

See [CONTRIBUTING.md](./CONTRIBUTING.md) for more detail.

---

## Getting access (private repo)

The repo is private, so each person needs to be a **collaborator**:

1. The owner (ZentricStudio) goes to
   **github.com/ZentricStudio/Nikitalinking → Settings → Collaborators**.
2. Click **Add people**, enter the person's GitHub username, and send the invite.
3. The person accepts the email/GitHub invite.
4. Their Claude Code must be signed in to that same GitHub account (or have a
   token with repo access) so it can read the private repo.
