#!/bin/zsh
# Copies the current sheet out of the health folder and publishes it.
set -e
SRC="$HOME/Google Drive/Documents Synced/AI Porphyria Flare and other Health Docs/Host Food Safety Sheet.html"
REPO="$HOME/Developer/host-food-sheet"
cp "$SRC" "$REPO/index.html"
cd "$REPO"
git add index.html
git commit -m "Update food sheet $(date '+%Y-%m-%d %H:%M')" || { echo "No changes to publish."; exit 0; }
git push
echo "Published. Live in about a minute."
