function start_ssh_agent
    # Check if SSH_AUTH_SOCK is already set
    if not set -q SSH_AUTH_SOCK
        echo "Starting ssh-agent..."
        # Start the agent and capture its output
        set -l agent_output (ssh-agent -s)
        # Parse the output to extract SSH_AUTH_SOCK and SSH_AGENT_PID
        for line in $agent_output
            if string match -q "SSH_AUTH_SOCK=*" $line
                # Extract value between '=' and ';'
                set -lx SSH_AUTH_SOCK (string replace -r '^SSH_AUTH_SOCK=([^;]+).*' '$1' $line)
            end
            if string match -q "SSH_AGENT_PID=*" $line
                set -lx SSH_AGENT_PID (string replace -r '^SSH_AGENT_PID=([^;]+).*' '$1' $line)
            end
        end
        echo "ssh-agent started (PID: $SSH_AGENT_PID)."
    else
        echo "ssh-agent is already running."
    end
end
