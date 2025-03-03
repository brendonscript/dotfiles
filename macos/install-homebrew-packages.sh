#!/usr/bin/env bash

# Install homebrew packages
if [[ "$(uname)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew Packages..."

  export HOMEBREW_NO_AUTO_UPDATE=1
  export HOMEBREW_NO_INSTALL_UPGRADE=1
  export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
  export HOMEBREW_BUNDLE_FILE=$HOME/.Brewfile
  brew bundle -q --no-upgrade --file ~/.Brewfile

  echo "All packages installed."
  exit 0
fi
