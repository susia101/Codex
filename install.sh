#!/usr/bin/env sh
set -eu

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DEST_DIR="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$DEST_DIR"
cp -R "$REPO_DIR/.codex/skills/loop-engineering" "$DEST_DIR/"

echo "Installed loop-engineering skill to $DEST_DIR/loop-engineering"
