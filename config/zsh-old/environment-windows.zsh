if [[ "$os" == "CYGWIN"* ]]; then
  # Code to run on Cygwin (Windows)
elif [[ "$os" =~ "MINGW" ]]; then
  # Code to run on MSYS (Git Bash or Windows Command Prompt)
fi
