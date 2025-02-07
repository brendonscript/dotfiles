function rl
    source $XDG_CONFIG_HOME/fish/config.fish

    for file in $XDG_CONFIG_HOME/fish/conf.d/*.fish
        source "$file"
    end

    for file in $XDG_CONFIG_HOME/fish/functions/*.fish
        source "$file"
    end
end
