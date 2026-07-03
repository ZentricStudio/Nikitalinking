# Linking a person (one by one)

Every person links their own Claude to the hub. Two things need to happen:
they get **access** to the private repo, and they **add** it inside Claude Code.

---

## Step 1 — Owner gives them access (collaborator)

The owner (ZentricStudio) does this once per person:

1. Go to **github.com/ZentricStudio/claude-hub → Settings → Collaborators**.
2. Click **Add people**.
3. Enter the person's **GitHub username**, pick them, send the invite.
4. The person accepts the invite (they get an email + a GitHub notification).

Now that person can read and push to the private repo.

---

## Step 2 — The person links their Claude (once)

On their machine, in Claude Code:

```
/plugin marketplace add ZentricStudio/claude-hub
/plugin install shared-library@zentric-hub
```

The first command may prompt them to sign in to GitHub — they use the account
that was invited as a collaborator.

That's it. They now have the group's shared skills and commands.

---

## Step 3 — (Optional) restore the full environment

If they also want the shared memory/settings and to back their own machine up
into the hub:

```
git clone https://github.com/ZentricStudio/claude-hub.git
cd claude-hub
bash scripts/install.sh
```

---

## Step 4 — Record them

Add the person to the table in the top-level `README.md` and create
`people/<their-name>/` from the pattern in `people/`.

---

## Getting updates

Whenever anyone adds something, each person runs:

```
/plugin marketplace update zentric-hub
```

to pull the latest shared tools.
