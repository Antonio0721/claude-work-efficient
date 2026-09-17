#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${HOME}/.claude/skills"

mkdir -p "$DEST"

echo "Installing claude-work-efficient skills into $DEST"
echo

for dir in "$SCRIPT_DIR"/skills/*/; do
  name="$(basename "$dir")"
  if [ -d "$DEST/$name" ]; then
    echo "SKIP (already installed): $name"
  else
    cp -r "$dir" "$DEST/$name"
    echo "INSTALLED: $name"
  fi
done

echo
echo "Done. Restart Claude Code (or start a new session) so it picks up the new skills."
echo "Then say: usa work-efficient"
echo
echo "Optional (21st.dev component catalog, installed as a plugin, not bundled here):"
echo "  claude plugin marketplace add 21st-dev/claude-code-plugin"
echo "  claude plugin install 21st@21st"
