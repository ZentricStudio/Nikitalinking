#!/usr/bin/env bash
#
# install.sh — restore the shared Claude environment onto THIS machine.
#
# Run this on a new machine after cloning the repo. It links the shared
# skills / commands / agents into ~/.claude and wires up the shared memory.
# Safe to run more than once — it backs up anything it would replace.
#
# Usage:  bash scripts/install.sh
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
STAMP="$(date +%Y%m%d-%H%M%S)"

echo "==> Repo:   $REPO_DIR"
echo "==> Target: $CLAUDE_DIR"
mkdir -p "$CLAUDE_DIR"

link_dir() {
  local name="$1"
  local src="$REPO_DIR/home-claude/$name"
  local dest="$CLAUDE_DIR/$name"
  [ -d "$src" ] || return 0
  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -e "$dest" ]; then
    echo "    backing up existing $dest -> ${dest}.backup-${STAMP}"
    mv "$dest" "${dest}.backup-${STAMP}"
  fi
  ln -s "$src" "$dest"
  echo "    linked ~/.claude/$name  ->  home-claude/$name"
}

echo "==> Linking skills / commands / agents..."
link_dir skills
link_dir commands
link_dir agents

# Shared memory: import it from the global CLAUDE.md instead of overwriting,
# so any personal memory on this machine is preserved.
echo "==> Wiring up shared memory (CLAUDE.md)..."
GLOBAL_MD="$CLAUDE_DIR/CLAUDE.md"
IMPORT_LINE="@$REPO_DIR/home-claude/CLAUDE.md"
if [ -f "$GLOBAL_MD" ] && grep -qF "$IMPORT_LINE" "$GLOBAL_MD"; then
  echo "    already imported"
elif [ -f "$GLOBAL_MD" ]; then
  printf '\n# Shared team memory (claude-hub)\n%s\n' "$IMPORT_LINE" >> "$GLOBAL_MD"
  echo "    added import to $GLOBAL_MD"
else
  printf '# Shared team memory (claude-hub)\n%s\n' "$IMPORT_LINE" > "$GLOBAL_MD"
  echo "    created $GLOBAL_MD"
fi

# Settings are NOT copied automatically (they can hold machine-specific values).
if [ -f "$REPO_DIR/home-claude/settings.example.json" ] && [ ! -f "$CLAUDE_DIR/settings.json" ]; then
  echo "==> No settings.json yet. Review home-claude/settings.example.json and copy what you want."
fi

cat <<EOF

==> Done. Last step — open Claude Code and link to the group:

      /plugin marketplace add ZentricStudio/claude-hub
      /plugin install shared-library@zentric-hub

    Then you have everyone's shared skills and commands too.
EOF
