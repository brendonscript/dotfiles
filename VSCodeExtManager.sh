#!/usr/bin/env bash

# Ensure VS Code CLI is available
if ! command -v code &>/dev/null; then
  echo "VS Code CLI not found. Ensure it's installed and in your PATH."
  exit 1
fi

# Collect installed extensions and display with fzf for selection
selected=$(code --list-extensions | fzf --multi \
  --header="Space: select, Tab: toggle selected, Ctrl-T: toggle all, Enter: confirm" \
  --bind="ctrl-t:toggle-all,space:toggle")

# Exit if nothing selected or user cancelled
if [ -z "$selected" ]; then
  echo "No extensions selected for uninstallation."
  exit 0
fi

# Count and display selected extensions
count=$(echo "$selected" | wc -l)
echo "Selected extensions ($count):"
echo "$selected" | sed 's/^/  - /'

# Confirm before uninstalling
read -p "Proceed with uninstallation? (y/N): " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Uninstallation cancelled."
  exit 0
fi

# Track results
success=0
failed=0

# Uninstall each selected extension
echo "Uninstalling extensions..."
while read -r extension; do
  echo -n "  $extension ... "

  if code --uninstall-extension "$extension" >/dev/null 2>&1; then
    echo "Success"
    ((success++))
  else
    echo "Failed"
    ((failed++))
  fi
done <<<"$selected"

# Display summary
echo "Complete: $success succeeded, $failed failed."
