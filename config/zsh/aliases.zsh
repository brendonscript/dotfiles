# Util
alias cls="clear -x"
alias clear="clear -x"
alias rl="exec zsh"

# Work
alias con="cd ~/Code/Work/OTTOv3/OTTO/OTTO.Connect/ClientApp"
alias cone="cd ~/Code/Work/OTTOv3/OTTO/OTTO.Connect/ClientApp/ && nvim"
alias con2="cd ~/Code/Work/OTTOv3-secondary/OTTO/OTTO.Connect/ClientApp/"
alias por="cd ~/Code/Work/OTTOv3/OTTO/DevPortal/ClientApp/"
alias work="cd ~/Code/Work/"

# Personal
alias notes="cd ~/Documents/Notes && nvim"

# Chezmoi
alias dot="chezmoi"
alias dotcd="chezmoi cd"
alias dotd="chezmoi diff"
alias dotr="chezmoi re-add"
alias dots="chezmoi status"
alias dota="chezmoi apply --interactive"
alias dotadd="chezmoi add"
alias dote="chezmoi edit --apply"
alias dotu="chezmoi unmanaged ."
alias dotup="chezmoi re-add && cd $(chezmoi source-path) && lazygit"
alias dotupp="chezmoi re-add && cd $(chezmoi source-path) && git commit -am 'up' || true && git push || true && cd -"
alias chc="cd $(chezmoi source-path)"

# Shortcuts
alias vim="nvim"
alias e="nvim"

if [[ "$os" == "Darwin" ]]; then
  alias brewup="brew update && brew upgrade"
  alias brewdump="RETURN_DIR=$(pwd) && cd $(dirname ${HOMEBREW_BUNDLE_FILE}) && rm -f Brewfile && brew bundle dump && chezmoi re-add Brewfile && cd $(chezmoi source-path)/dot_config/homebrew && git add Brewfile && git commit -m 'Updated Brewfile' || true && git push || true && cd ${RETURN_DIR}"
fi

alias lg="lazygit"
alias gu="gitui"
alias dir="vifm ."
alias clearswp="rm -rf ~/.local/state/nvim/swap"
alias nvim-clear-data="rm -rf ~/.local/state/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim"
alias nvim-gui="neovide=--multigrid --frame=none"
alias pip="pip3"
alias emacs-c="emacsclient -c -a emacs"
alias emacs-s="/opt/homebrew/opt/emacs-plus@28/bin/emacs --fg-daemon"
alias theme="nvim -O ~/.config/chezmoi/chezmoi.jsonc ~/.config/chezmoi/colorschemes.txt"
# alias conf --set-cursor "cd ~/.config/%"
# alias dconf --position anywhere --set-cursor "~/.config/%"
alias ffdebug="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox -start-debugger-server"
alias tmux-status-on="tmux set -p status on"
alias tmux-status-off="tmux set -p status off"
alias vscode="NVIM_APPNAME=nvim-vscode code"
# abbr -a tmp --set-cursor "nvim /tmp/(random)%"
alias matrix="iamb"
alias python="python3"

# Config
alias nvc="cd ~/.config/nvim && nvim"
alias kic="cd ~/.config/kitty && nvim"
alias zsc="cd ~/.config/zsh && nvim"
alias tmc="cd ~/.config/tmux && nvim"
alias vsc="cd ~/Library/Application\ Support/Code/User && nvim"
alias fic="cd ~/.config/fish && nvim"
alias amc="cd ~/.config/amethyst && nvim amethyst.yml"
alias hac="cd ~/.hammerspoon && nvim init.lua"
alias config="cd $XDG_CONFIG_HOME"

# Node
alias npi="npm i"
alias nps="npm start"
alias npis="npm i && npm start"
alias pni="pnpm i"
alias pns="pnpm start"
alias pnis="pnpm i && pnpm start"

if command -v ssh-agent.exe &>/dev/null; then
  alias ssh-agent="ssh-agent.exe"
  alias ssh-add="ssh-add.exe"
  alias startssh="ssh-agent -s"
  alias addssh="ssh-add ~/.ssh/id_rsa"
else
  alias startssh="ssh-agent -s"
  alias addssh="ssh-add --apple-use-keychain ~/.ssh/id_rsa"
fi

if command -v eza &>/dev/null; then
  alias ls="eza"                                                         # ls
  alias l="eza -lbF --git"                                               # list, size, type, git
  alias ll="eza -lbGF --git"                                             # long list
  alias llm="eza -lbGF --git --sort=modified"                            # long list, modified date sort
  alias la="eza -lbhHigUmuSa --time-style=long-iso --git --color-scale"  # all list
  alias lx="eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale" # all + extended list
  alias lsd="eza -da .*"
  alias tree="eza -T"
fi

command -v rg &>/dev/null && alias grep="rg"
command -v bat &>/dev/null && alias cat="bat"

if command -v pbcopy &>/dev/null; then
  alias clip="pbcopy"
  alias copy="pbcopy"
  alias copypath="pwd | pbcopy"
fi

if command -v shortcuts &>/dev/null; then
  alias show-menu='shortcuts run "Show Menubar"'
  alias hide-menu='shortcuts run "Hide Menubar"'
fi

# Write a function that takes a filename as an argument, uses fd and pipes the output to fzf to select a file, and then opens that file using the default editor
function nvf() {
  local file="$1"
  if [[ -z "$file" ]]; then
    echo "No file specified"
    return 1
  fi
  fd -tf "$file" | fzf --bind 'enter:become(nvim {})'
}
