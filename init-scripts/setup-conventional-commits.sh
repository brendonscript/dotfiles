#!/usr/bin/env bash

set -e

DOTFILES_DIR=$HOME/.dotfiles
SETUP_MARKER="$DOTFILES_DIR/.conventional-commits-initialized"

# Skip if already initialized
if [[ -f "$SETUP_MARKER" ]]; then
  echo "Conventional commits already set up."
  exit 0
fi

echo "Setting up conventional commits..."

# Check if required files exist
if [[ ! -f "$DOTFILES_DIR/package.json" ]]; then
  echo "Error: package.json not found. Please create it manually before running this script."
  exit 1
fi

if [[ ! -f "$DOTFILES_DIR/commitlint.config.js" ]]; then
  echo "Error: commitlint.config.js not found. Please create it manually before running this script."
  exit 1
fi

if [[ ! -d "$DOTFILES_DIR/.husky" ]]; then
  echo "Error: .husky directory not found. Please create it manually before running this script."
  exit 1
fi

# Install dependencies
cd "$DOTFILES_DIR"
npm install

# Create a marker file to indicate setup is complete
touch "$SETUP_MARKER"

echo "Conventional commits setup complete!"

exit 0
