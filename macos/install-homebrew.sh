#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles
MACOS_SCRIPTS_DIR=$DOTFILES_DIR/macos

# Check if the OS is macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "Homebrew is only configured for MacOS"
  exit 0
# Install homebrew if not installed
elif ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Configuring Homebrew paths"
  echo >>/Users/brendon/.zprofile
  echo "eval $(/opt/homebrew/bin/brew shellenv)" >>/Users/brendon/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  "$MACOS_SCRIPTS_DIR"/install-homebrew-packages.sh
else
  echo "Homebrew is already installed"
  exit 0
fi
