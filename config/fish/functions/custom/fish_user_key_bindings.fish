function fish_user_key_bindings
    fish_vi_key_bindings

    # This binds "jk" to switch to normal mode in vi-mode.
    # If you kept it like that, every time you press "j",
    # fish would wait for a "k" or other key to disambiguate
    bind -M insert -m default jk cancel repaint-mode

    # After setting this, fish only waits 200ms for the "k",
    # or decides to treat the "j" as a separate sequence, inserting it.
    set -g fish_sequence_key_delay_ms 200

    set -g fish_vi_force_cursor 1

    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    bind -M insert \cf forward-word
    bind -M insert \cf forward-char

    bind -M insert --erase \cT
    bind -M insert --erase \cR

    bind -M insert \cT tv_smart_autocomplete
    bind -M insert \cR tv_shell_history
end
