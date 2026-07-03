#!/usr/bin/env bash
#
# update.sh — pull the latest from the hub onto this machine.
#
# Usage:  bash scripts/update.sh
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

echo "==> Pulling latest..."
git pull --ff-only

echo "==> Re-linking (in case new folders appeared)..."
bash "$REPO_DIR/scripts/install.sh"

cat <<EOF

==> Updated. To also refresh shared plugins, open Claude Code and run:

      /plugin marketplace update zentric-hub
EOF
