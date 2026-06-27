#!/usr/bin/env bash
# Install the agent-resources product team into the CURRENT git repo.
# agent-resources is public, so this needs no authentication.
#
# Usage (run from inside the target repo, e.g. servicedesk):
#   bash bootstrap-into-repo.sh            # team only (agents + skills)
#   bash bootstrap-into-repo.sh servicedesk  # team + the servicedesk internal-platform CLAUDE.md
#
# Or run it straight from GitHub inside a Claude Code session:
#   bash <(curl -fsSL https://raw.githubusercontent.com/mhogild/agent-resources/main/scripts/bootstrap-into-repo.sh) servicedesk
set -euo pipefail

SRC_REPO="https://github.com/mhogild/agent-resources.git"
PROFILE="${1:-}"   # pass "servicedesk" to also install the internal-platform CLAUDE.md

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

echo "Cloning the team from $SRC_REPO ..."
git clone --depth 1 "$SRC_REPO" "$TMP/ar" >/dev/null 2>&1

mkdir -p "$ROOT/.claude/agents" "$ROOT/.claude/skills"
cp -R "$TMP/ar/.claude/agents/." "$ROOT/.claude/agents/"
cp -R "$TMP/ar/.claude/skills/." "$ROOT/.claude/skills/"
echo "  installed agents + skills into .claude/"

if [ "$PROFILE" = "servicedesk" ]; then
  if [ -f "$ROOT/CLAUDE.md" ] && ! grep -q "internal platform profile" "$ROOT/CLAUDE.md"; then
    cp "$ROOT/CLAUDE.md" "$ROOT/CLAUDE.md.bak"
    echo "  backed up existing CLAUDE.md -> CLAUDE.md.bak"
  fi
  cp "$TMP/ar/templates/servicedesk-CLAUDE.md" "$ROOT/CLAUDE.md"
  echo "  installed servicedesk internal-platform profile as CLAUDE.md"
fi

echo ""
echo "Done. Review the changes, then commit:"
echo "  git add .claude CLAUDE.md && git commit -m 'Add agent-resources product team'"
echo "Re-run this script any time to pull the latest team."
