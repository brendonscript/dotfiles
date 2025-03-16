#!/usr/bin/env bash
SSH_FILES="$HOME/.ssh"

# Ensure the .ssh directory exists
mkdir -p "$SSH_FILES"

echo "Configuring Personal SSH Key..."
PERSONAL_KEY="$SSH_FILES/personal_rsa"
if [[ ! -f "$PERSONAL_KEY" ]]; then
  echo "Personal SSH Key does not exist. Generating a new key..."
  ssh-keygen -t rsa -b 4096 -f "$PERSONAL_KEY" -N "" -C "personal"
fi

# Check if the personal key is added to the ssh-agent
personal_pub=$(ssh-keygen -y -f "$PERSONAL_KEY")
if ssh-add -L 2>/dev/null | grep -Fq "$personal_pub"; then
  echo "Personal SSH Key is already added to the agent."
else
  ssh-add --apple-use-keychain "$PERSONAL_KEY"
fi

echo "Configuring Work SSH Key..."
WORK_KEY="$SSH_FILES/work_rsa"
if [[ ! -f "$WORK_KEY" ]]; then
  echo "Work SSH Key does not exist. Generating a new key..."
  ssh-keygen -t rsa -b 4096 -f "$WORK_KEY" -N "" -C "work"
fi

# Check if the work key is added to the ssh-agent
work_pub=$(ssh-keygen -y -f "$WORK_KEY")
if ssh-add -L 2>/dev/null | grep -Fq "$work_pub"; then
  echo "Work SSH Key is already added to the agent."
else
  ssh-add --apple-use-keychain "$WORK_KEY"
fi
