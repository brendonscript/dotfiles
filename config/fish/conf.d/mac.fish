if test (uname) = Darwin
    fish_add_path /opt/homebrew/opt/llvm/bin
    fish_add_path /Applications/Emacs.app/Contents/MacOS/bin
    fish_add_path /opt/homebrew/sbin
    fish_add_path -m /opt/homebrew/bin

    set -gx PKG_CONFIG_PATH /opt/homebrew/Cellar/zlib/1.2.11/lib/pkgconfig:/opt/homebrew/lib/pkgconfig
    set -gx HOMEBREW_NO_ENV_HINTS 1
    set -gx HOMEBREW_BUNDLE_DUMP_NO_VSCODE 1
    set -gx HOMEBREW_BUNDLE_MAS_SKIP "Xcode Keynote Numbers 'Okta Verify' iMovie GarageBand Mapper Pages"
    set -gx HOMEBREW_BUNDLE_FILE "$HOME/Brewfile"

    abbr brewup update-homebrew
    abbr brewdump dump-homebrew
    abbr brewdot update-dotfiles-homebrew

    if type -q shortcuts
        abbr --add show-menu 'shortcuts run "Show Menubar"'
        abbr --add hide-menu 'shortcuts run "Hide Menubar"'
    end
end
