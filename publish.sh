#!/bin/zsh
# Copies the current sheet out of the health folder and publishes it.
set -e
SRC="$HOME/Google Drive/Documents Synced/AI Porphyria Flare and other Health Docs/Host Food Safety Sheet.html"
REPO="$HOME/Developer/host-food-sheet"
cd "$REPO"
git fetch -q origin
git reset --hard -q origin/main          # the folder file is always the source of truth
cp "$SRC" "$REPO/index.html"
git add index.html publish.sh
git commit -q -m "Update food sheet $(date '+%Y-%m-%d %H:%M')" || { echo "No changes to publish."; exit 0; }
git push -q origin main
echo "Published. Live in about a minute."
