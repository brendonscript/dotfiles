if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    tv init fish | source
end

set -gx fish_greeting ""

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx FISH_HOME $XDG_CONFIG_HOME/fish

# fish_add_path -m $HOME/.local/share/bob/nvim-bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share
fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.dotnet/tools
fish_add_path $XDG_CONFIG_HOME/emacs/bin
fish_add_path /usr/local/bin

# add function subdirs to fish_function_path
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

# add completion subdirs to fish_completion_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

set -x GPG_TTY (tty)
set -x ALTERNATE_EDITOR ""
set -x EDITOR nvim
set -x VISUAL nvim
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x PAGER bat
set -x VI_MODE_RESET_PROMPT_ON_MODE_CHANGE true
set -x VI_MODE_SET_CURSOR true
set -x PRETTIERD_LOCAL_PRETTIER_ONLY 1
# set -x BOB_CONFIG "$HOME/.config/bob/config.json"
set -x COREPACK_ENABLE_AUTO_PIN 0
set -x SSH_AUTH_SOCK ~/.1password/agent.sock
set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
set -g -x TALISMAN_INTERACTIVE true
set -g -x PIP_REQUIRE_VIRTUALENV true

# set -g fish_vi_force_cursor 1
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line

if type -q gh
    gh completion -s fish | source
end

if type -q go
    fish_add_path (go env GOPATH)/bin
end

if type -q mise
    mise activate fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fzf --fish | source
end

if not type -q fisher
    echo "Run the following to install fisher"
    echo "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update"
end
# function tv_smart_autocomplete
#     set -l current_prompt (commandline -cp)
#
#     set -l output (tv --autocomplete-prompt "$current_prompt")
#
#     if test -n "$output"
#         # add a space if the prompt does not end with one (unless the prompt is an implicit cd, e.g. '\.')
#         string match -r '.*( |./)$' -- "$current_prompt" || set current_prompt "$current_prompt "
#         commandline -r "$current_prompt$output"
#         commandline -f repaint
#     end
# end
#
# function tv_shell_history
#     set -l current_prompt (commandline -cp)
#
#     set -l output (tv fish-history --input "$current_prompt")
#
#     if test -n "$output"
#         commandline -r "$output"
#         commandline -f repaint
#     end
# end

# Added by Windsurf
fish_add_path /Users/brendon/.codeium/windsurf/bin

# Added by Windsurf - Next
fish_add_path /Users/brendon/.codeium/windsurf/bin
