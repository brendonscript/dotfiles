#!/usr/bin/env bash
SSH_FILES=$HOME/.ssh

echo "Configuring Personal SSH Key..."
if [[ ! -e $SSH_FILES/personal_rsa ]]; then
  ssh-add --apple-use-keychain "$SSH_FILES"/personal_rsa
else
  echo "Personal SSH Key already exists."
fi

echo "Configuring Work SSH Key..."
if [[ ! -e $SSH_FILES/work_rsa ]]; then
  ssh-add --apple-use-keychain "$SSH_FILES"/work_rsa
else
  echo "Work SSH Key already exists."
fi
