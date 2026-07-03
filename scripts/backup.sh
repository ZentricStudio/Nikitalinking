#!/usr/bin/env bash
#
# backup.sh — save THIS machine's Claude setup into the repo, then push.
#
# Run this on your CURRENT machine before moving to a new one (or any time you
# want to capture new skills/commands/memory). It copies ~/.claude content into
# home-claude/, commits, and pushes so nothing is lost.
#
# Usage:  bash scripts/backup.sh
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

copy_dir() {
  local name="$1"
  local src="$CLAUDE_DIR/$name"
  local dest="$REPO_DIR/home-claude/$name"
  if [ ! -d "$src" ]; then echo "    (no ~/.claude/$name, skipping)"; return 0; fi
  # If this dir is a symlink into the repo (created by install.sh) it's already tracked.
  if [ -L "$src" ]; then echo "    (~/.claude/$name is linked to the repo already, skipping)"; return 0; fi
  mkdir -p "$dest"
  rsync -a --delete --exclude '.git' "$src/" "$dest/"
  echo "    backed up ~/.claude/$name  ->  home-claude/$name"
}

echo "==> Backing up from $CLAUDE_DIR ..."
copy_dir skills
copy_dir commands
copy_dir agents

# Shared memory: only update if a global CLAUDE.md exists and isn't just the import line.
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo "    (leaving home-claude/CLAUDE.md as the shared memory — edit it directly to change shared notes)"
fi

# Settings: copy as a reference file. REVIEW IT for secrets before it gets committed.
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  cp "$CLAUDE_DIR/settings.json" "$REPO_DIR/home-claude/settings.backup.json"
  echo "    copied settings.json -> home-claude/settings.backup.json"
  echo "    NOTE: settings.backup.json is gitignored by default. Review it, then"
  echo "          hand-copy safe values into home-claude/settings.example.json to share them."
fi

echo "==> Committing and pushing..."
cd "$REPO_DIR"
git add -A
if git diff --cached --quiet; then
  echo "    nothing changed — already up to date."
else
  git commit -m "Backup Claude environment ($(hostname) $(date +%Y-%m-%d))"
  git push
  echo "==> Pushed. Your setup is safe."
fi
