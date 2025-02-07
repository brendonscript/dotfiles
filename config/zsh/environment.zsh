path+=("$HOME/.local/bin")
path+=("$HOME/.local/share")
path+=("$HOME/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.dotnet/tools")
path+=("$XDG_CONFIG_HOME/emacs/bin")
path+=("/usr/local/bin")

os=$(uname -s)
source $ZDOTDIR/environment-mac.zsh
source $ZDOTDIR/environment-linux.zsh
source $ZDOTDIR/environment-windows.zsh

path=("$HOME/.local/share/bob/nvim-bin" $path)

export MISE_NODE_DEFAULT_PACKAGES_FILE="${XDG_CONFIG_HOME}/npm/default-packages"
export GPG_TTY=$(tty)
export ALTERNATE_EDITOR=""
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="bat"
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true
export PRETTIERD_LOCAL_PRETTIER_ONLY=1
export BOB_CONFIG="$HOME/.config/bob/config.json"
export COREPACK_ENABLE_AUTO_PIN=0

export SSH_AUTH_SOCK=~/.1password/agent.sock

if command -v go &>/dev/null; then
  path+=("$(go env GOPATH)/bin")
fi
