function quick-note
    set file ~/Documents/Notes/brendOS.md

    # Check if the Obsidian process is running
    if not pgrep -x Obsidian >/dev/null
        echo "Obsidian is not running. Attempting to start it..."
        open -a Obsidian
        # Give Obsidian a moment to launch
        sleep 2

        # Check again if it successfully started
        if not pgrep -x Obsidian >/dev/null
            echo "Error: Failed to start Obsidian. Please start it manually." >&2
            return 1
        end
    end

    # Ensure the directory exists
    if not test -d (dirname $file)
        mkdir -p (dirname $file)
    end

    # If no argument is provided, open Vim for input
    if test (count $argv) -eq 0
        set temp_file (mktemp)
        nvim $temp_file

        # Append the content of the temp file to the notes file
        if test -s $temp_file
            # Add a blank line to the notes file only if it is not empty
            if test -s $file
                echo "" >>$file
            end
            cat $temp_file >>$file
            echo "Note added from Vim."
        else
            echo "No content added; temp file is empty."
        end

        rm $temp_file
        return
    end

    # If an argument is provided, append it directly
    if test -n $argv
        # Add a blank line to the notes file only if it is not empty
        if test -s $file
            echo "" >>$file
        end
        echo $argv >>$file
        echo "Note added: $argv"
    end
end
