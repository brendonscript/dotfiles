if test (uname) = Darwin

    function install_homebrew_packages
        if test (uname) = Darwin; and type -q brew
            echo "Installing Homebrew Packages..."

            # Export environment variables
            set -gx HOMEBREW_NO_AUTO_UPDATE 1
            set -gx HOMEBREW_NO_INSTALL_UPGRADE 1
            set -gx HOMEBREW_BUNDLE_DUMP_NO_VSCODE 1
            set -gx HOMEBREW_BUNDLE_FILE $HOME/Brewfile

            # Run brew bundle
            brew bundle -q --no-upgrade --file ~/Brewfile

            echo "All packages installed."
            return 0
        end
    end

    # Homebrew environment configuration

    # Add "gnubin" directories for coreutils and GNU sed
    fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
    fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin

    # Add PATH entries for keg-only packages
    fish_add_path /opt/homebrew/opt/expat/bin
    fish_add_path /opt/homebrew/opt/libiconv/bin
    fish_add_path /opt/homebrew/opt/libxml2/bin

    # Set environment variables for expat
    set -gx LDFLAGS $LDFLAGS -L/opt/homebrew/opt/expat/lib
    set -gx CPPFLAGS $CPPFLAGS -I/opt/homebrew/opt/expat/include
    set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/homebrew/opt/expat/lib/pkgconfig

    # Set environment variables for libffi
    set -gx LDFLAGS $LDFLAGS -L/opt/homebrew/opt/libffi/lib
    set -gx CPPFLAGS $CPPFLAGS -I/opt/homebrew/opt/libffi/include
    set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/homebrew/opt/libffi/lib/pkgconfig

    # Set environment variables for libiconv
    set -gx LDFLAGS $LDFLAGS -L/opt/homebrew/opt/libiconv/lib
    set -gx CPPFLAGS $CPPFLAGS -I/opt/homebrew/opt/libiconv/include

    # Set environment variables for libxml2
    set -gx LDFLAGS $LDFLAGS -L/opt/homebrew/opt/libxml2/lib
    set -gx CPPFLAGS $CPPFLAGS -I/opt/homebrew/opt/libxml2/include
    set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/homebrew/opt/libxml2/lib/pkgconfig

    # Set environment variables for zlib
    set -gx LDFLAGS $LDFLAGS -L/opt/homebrew/opt/zlib/lib
    set -gx CPPFLAGS $CPPFLAGS -I/opt/homebrew/opt/zlib/include
    set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/homebrew/opt/zlib/lib/pkgconfig

    #   fish_add_path /opt/homebrew/opt/llvm/bin
    #   # fish_add_path /Applications/Emacs.app/Contents/MacOS/bin
    #   # fish_add_path /opt/homebrew/sbin
    #   fish_add_path -m /opt/homebrew/bin
    #   fish_add_path /Users/brendon/.codeium/windsurf/bin
    #   fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
    #   fish_add_path /opt/homebrew/opt/expat/bin
    #   fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin
    #   fish_add_path /opt/homebrew/opt/libiconv/bin
    #   fish_add_path /opt/homebrew/opt/libxml2/bin
    # fish_add_path /opt/homebrew/opt/expat/bin
    #   # set -gx LDFLAGS -L/opt/homebrew/opt/libxml2/lib
    #   # set -gx CPPFLAGS -I/opt/homebrew/opt/libxml2/include
    #   # set -gx LDFLAGS -L/opt/homebrew/opt/libffi/lib
    #   # set -gx CPPFLAGS -I/opt/homebrew/opt/libffi/include
    #   # set -gx LDFLAGS -L/opt/homebrew/opt/expat/lib
    #   # set -gx CPPFLAGS -I/opt/homebrew/opt/expat/include
    #   # set -gx LDFLAGS -L/opt/homebrew/opt/libiconv/lib
    #   # set -gx CPPFLAGS -I/opt/homebrew/opt/libiconv/include
    #   # set -gx PKG_CONFIG_PATH /opt/homebrew/opt/zlib/lib/pkgconfig

    if test -d "/Applications/Emacs.app/Contents/MacOS/bin"
        fish_add_path /Applications/Emacs.app/Contents/MacOS/bin
        # alias emacs="emacs -nw"
    end

    # set -gx PKG_CONFIG_PATH /opt/homebrew/Cellar/zlib/1.2.11/lib/pkgconfig:/opt/homebrew/lib/pkgconfig
    set -gx HOMEBREW_NO_ENV_HINTS 1
    set -gx HOMEBREW_BUNDLE_DUMP_NO_VSCODE 1
    set -gx HOMEBREW_BUNDLE_MAS_SKIP "Xcode Keynote Numbers 'Okta Verify' iMovie GarageBand Mapper Pages"
    set -gx HOMEBREW_BUNDLE_FILE "$HOME/Brewfile"

    abbr brewup "brew update && brew upgrade"
    abbr brewdump "brew bundle dump --force --global"
    abbr brewdot "brew bundle dump --force"
    abbr brewinstall install_homebrew_packages

    if type -q shortcuts
        abbr --add show-menu 'shortcuts run "Show Menubar"'
        abbr --add hide-menu 'shortcuts run "Hide Menubar"'
    end
end
