#!/usr/bin/env bash
# Install the agent team globally so it's available in EVERY project on this
# machine (~/.claude). Re-run after editing the team to push updates globally.
#
# Usage:  bash scripts/install-global.sh
#
# What it does: copies this repo's agents, commands, and skills into ~/.claude.
# It does NOT delete anything you already have there; it overwrites same-named
# files with this repo's versions. Your existing global config is otherwise kept.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${CLAUDE_HOME:-$HOME/.claude}"

echo "Installing agent team from: $REPO_DIR"
echo "                       into: $DEST"
mkdir -p "$DEST/agents" "$DEST/commands" "$DEST/skills"

copy_tree() {
  local sub="$1"
  if [ -d "$REPO_DIR/.claude/$sub" ]; then
    cp -R "$REPO_DIR/.claude/$sub/." "$DEST/$sub/"
    echo "  installed $sub/"
  fi
}

copy_tree agents
copy_tree commands
copy_tree skills

echo "Done. The team is now available in every project via /build, /discovery,"
echo "/ship, /retro and the subagents (solution-architect, coder, code-reviewer,"
echo "verifier)."
