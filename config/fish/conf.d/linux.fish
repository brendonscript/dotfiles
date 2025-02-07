if test (uname) = Linux
    abbr -a notes "cd ~/Documents/Notes && nvim"
    if test -n (grep -i microsoft /proc/version)
        # WSL
        abbr -a --set-cursor home 'cd /mnt/c/Users/Brendon/%'

        abbr -e notes
        abbr -a notes "cd /mnt/c/Users/Brendon/Documents/Notes && nvim ."
    end
end
