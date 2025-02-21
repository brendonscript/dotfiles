if [[ "$os" == "Darwin" ]]; then
  # Code to run on macOS
  path+=("/Library/Frameworks/Mono.framework/Versions/Current/Commands")
  path+=("/opt/homebrew/opt/llvm/bin")
  path+=("/Applications/Emacs.app/Contents/MacOS/bin")

  path=("/opt/homebrew/sbin" $path)
  path=("/opt/homebrew/bin" $path)

  export PKG_CONFIG_PATH='/opt/homebrew/Cellar/zlib/1.2.11/lib/pkgconfig:/opt/homebrew/lib/pkgconfig'
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_BUNDLE_FILE="${XDG_CONFIG_HOME}/homebrew/Brewfile"
  export HOMEBREW_BUNDLE_MAS_SKIP="Xcode Keynote Numbers 'Okta Verify'"
fi
