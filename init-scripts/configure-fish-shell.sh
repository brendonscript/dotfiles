#!/usr/bin/env bash

if [[ ! "$SHELL" == *fish* ]]; then
  echo "Configuring Fish shell..."

  which fish | sudo tee -a /etc/shells
  chsh -s "$(which fish)"
else
  echo "Fish shell already configured"
fi
