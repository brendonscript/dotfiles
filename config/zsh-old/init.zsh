source $ZDOTDIR/aliases.zsh

# bindkey -v
#
# function zle-keymap-select() {
#   case $KEYMAP in
#   vicmd) echo -ne '\e[1 q' ;;        # block
#   viins | main) echo -ne '\e[5 q' ;; # beam
#   esac
# }
#
# zle -N zle-keymap-select
#
# zle-line-init() {
#   # zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#   echo -ne "\e[5 q"
# }
#
# zle -N zle-line-init
# echo -ne '\e[5 q'                # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q'; } # Use beam shape cursor for each new prompt.
#
# # export KEYTIMEOUT=1
# bindkey -M viins 'jk' vi-cmd-mode
# bindkey '^F' autosuggest-accept

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v mise &>/dev/null && eval "$(mise activate zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v gh &>/dev/null; then
  source <(gh completion -s zsh)

  if eval $(gh extension list | grep -q "gh copilot" &>/dev/null); then
    eval "$(gh copilot alias -- zsh)"
  else
    eval "$(gh extension install github/gh-copilot && gh copilot alias -- zsh)"
  fi
fi
