# Util
abbr -a cls "clear -x"
abbr -a clear "clear -x"

# Work
abbr -a con "cd ~/Developer/Work/OTTOv3/OTTO/OTTO.Connect/ClientApp"
abbr -a cone "cd ~/Developer/Work/OTTOv3/OTTO/OTTO.Connect/ClientApp && nvim"
abbr -a con2 "cd ~/Developer/Work/OTTOv3-secondary/OTTO/OTTO.Connect/ClientApp/"
abbr -a por "cd ~/Developer/Work/OTTOv3/OTTO/DevPortal/ClientApp/"
abbr -a work "cd ~/Developer/Work/"

# Personal

abbr -a dot "cd ~/.dotfiles"

# Shortcuts
abbr -a vim nvim
abbr -a e nvim
abbr -a lg lazygit
abbr -a ld lazydocker
abbr -a gg gitui
abbr -a dir yazi
abbr -a clearswp "rm -rf ~/.local/state/nvim/swap"
abbr -a nvim-clear-data "rm -rf ~/.local/state/nvim; and rm -rf ~/.local/share/nvim; and rm -rf ~/.cache/nvim"
abbr -a nvim-gui "neovide --multigrid --frame=none"
abbr -a pip pip3
abbr -a emacs-c "emacsclient -c -a emacs"
abbr -a emacs-s "/opt/homebrew/opt/emacs-plus@28/bin/emacs --fg-daemon"
abbr -a theme "nvim -O ~/.config/chezmoi/chezmoi.jsonc ~/.config/chezmoi/colorschemes.txt"
# abbr -a conf --set-cursor "cd ~/.config/%"
# abbr -a dconf --position anywhere --set-cursor "~/.config/%"
abbr -a ffdebug "/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox -start-debugger-server"
abbr -a tmux-status-on "tmux set -p status on"
abbr -a tmux-status-off "tmux set -p status off"
abbr -a vscode "NVIM_APPNAME=nvim-vscode code"
abbr -a nvimk "NVIM_APPNAME=nvim-kickstart nvim"
abbr -a v nvim
abbr -a python python3
abbr -a zz zi
abbr -a - "cd -"
abbr -a !! --position anywhere --function last_history_item
abbr -a b "cd -"
abbr -a h --position anywhere "$HOME/.dotfiles"
abbr -a wmt "aerospace enable toggle"

abbr -a talisman-interactive "talisman -i -g pre-commit"

abbr -a restart-sketchy-bar "brew services restart sketchybar"

# Config
abbr -a nvc "cd ~/.config/nvim && nvim"
abbr -a kic "cd ~/.config/kitty && nvim"
abbr -a zsc "cd ~/.config/zsh && nvim"
abbr -a tmc "cd ~/.config/tmux && nvim"
abbr -a vsc "cd ~/Library/Application Support/Code/User && nvim"
abbr -a fic "cd ~/.config/fish && nvim"
abbr -a aero "cd ~/.config/aerospace && nvim"
abbr -a hac "cd ~/.hammerspoon && nvim init.lua"
abbr -a config "cd $XDG_CONFIG_HOME"

# Zellij
abbr -a zjk "zellij kill-all-sessions"
abbr -a zjd "zellij delete-all-sessions"
abbr -a zja "zellij a"

# Notes
abbr -a qnote quick-note
abbr -a qn quick-note
abbr -a notes "cd ~/Documents/Notes"
abbr -a n "cd ~/Documents/Notes && nvim"
abbr -a scratch "nvim ~/Documents/Notes/brendOS.md"

# Docker
abbr -a dcu "docker compose up -d"
abbr -a dcd "docker compose down"

# Node
abbr -a npi "npm i"
abbr -a nps "npm start"
abbr -a npis "npm i && npm start"
abbr -a pni "pnpm i"
abbr -a pns "pnpm start"
abbr -a pnis "pnpm i && pnpm start"

if type -q ssh-agent.exe
    abbr -a ssh-agent "ssh-agent.exe"
    abbr -a ssh-add "ssh-add.exe"
    abbr -a startssh "ssh-agent -s"
    abbr -a addssh "ssh-add ~/.ssh/id_rsa"
else
    abbr -a startssh "ssh-agent -s"
end

abbr -a --set-cursor new-ssh "ssh-keygen -t rsa -b 4096 -C %"

if type -q eza
    abbr -a ls eza
    abbr -a lsa "eza -a"
    abbr -a l "eza -lbF --git"
    abbr -a ll "eza -lbGF --git"
    abbr -a llm "eza -lbGF --git --sort=modified"
    abbr -a la "eza -lbhHigUmuSa --time-style=long-iso --git --color-scale"
    abbr -a lx "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale"
    abbr -a lsd "eza -da .*"
    abbr -a tree "eza -T"
end

type -q rg; and abbr -a grep rg
type -q bat; and abbr -a cat bat

if type -q pbcopy
    abbr -a clip pbcopy
    abbr -a copy pbcopy
    abbr -a copypath "pwd | pbcopy"
end
