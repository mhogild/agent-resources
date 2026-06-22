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
mkdir -p "$DEST/agents" "$DEST/skills"

copy_tree() {
  local sub="$1"
  if [ -d "$REPO_DIR/.claude/$sub" ]; then
    cp -R "$REPO_DIR/.claude/$sub/." "$DEST/$sub/"
    echo "  installed $sub/"
  fi
}

copy_tree agents
copy_tree skills

# Operating manual → global memory, so the autonomy posture applies everywhere.
# If you already have ~/.claude/CLAUDE.md, we append rather than overwrite.
if [ -f "$REPO_DIR/CLAUDE.md" ]; then
  if [ -f "$DEST/CLAUDE.md" ] && ! grep -q "Operating Manual — agent-resources" "$DEST/CLAUDE.md"; then
    { echo ""; echo "---"; cat "$REPO_DIR/CLAUDE.md"; } >> "$DEST/CLAUDE.md"
    echo "  appended CLAUDE.md operating manual to existing global memory"
  else
    cp "$REPO_DIR/CLAUDE.md" "$DEST/CLAUDE.md"
    echo "  installed CLAUDE.md (global operating manual)"
  fi
fi

echo "Done. The team is now available in every project via the build, discovery,"
echo "quick, ship, progress and retro skills, plus the subagents"
echo "(solution-architect, coder, code-reviewer, verifier)."
