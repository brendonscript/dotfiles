#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles
INIT_SCRIPTS_DIR=$DOTFILES_DIR/init-scripts
MACOS_SCRIPTS_DIR=$DOTFILES_DIR/macos
DOTFILES_INIT_FILE="$DOTFILES_DIR"/.initialized-dotfiles

green_echo() {
  echo -e "\033[32m$1\033[0m"
}

if [[ -e $DOTFILES_INIT_FILE ]]; then
  green_echo "Dotfiles already initialized."
  green_echo "Remove $DOTFILES_INIT_FILE to reinitialize."
  exit 0
else
  # Install Homebrew
  "$MACOS_SCRIPTS_DIR"/install-homebrew.sh

  # Set Fish shell as default
  "$INIT_SCRIPTS_DIR"/configure-fish-shell.sh

  # Configure SSH keys
  "$INIT_SCRIPTS_DIR"/configure-ssh.sh

  # Setup Mise
  echo "Installing Mise..."
  mise install

  touch "$DOTFILES_INIT_FILE"

  exit 0
fi
