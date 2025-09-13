# Automatically run `ls` when `$eza_run_on_cd` is set
function _auto_ls --on-variable PWD
    if status is-interactive
        if set -q eza_run_on_cd
            _ls
        end
    end
end

function _fish_eza_install --on-event fish-eza_install
    # Handle dumb terminal case
    if test "$TERM" = dumb
        echo "you are sourcing the fish plugin for eza"
        echo "in a dumb terminal, which won't support it"

        return 1
    end

    if command -q eza
        # see ../functions/00-ls.fish
        alias ls _ls

        alias la 'eza -lbhHigUmuSa'
        alias lx 'eza -lbhHigUmuSa@'

    else # `eza` command not found
        echo "eza is not installed but you're"
        echo "sourcing the fish plugin for it"

        return 1
    end
end

function _fish_eza_uninstall --on-event fish-eza_uninstall
    functions --erase ls
    functions --erase l
    functions --erase ll
    functions --erase llm
    functions --erase lt
    functions --erase tree

    functions --erase la
    functions --erase lx

    functions --erase ls
    functions --erase _auto_ls

    set --erase eza_params
    set --erase eza_run_on_cd
end

function _fish_eza_update --on-event fish-eza_update
    _fish_eza_uninstall
    _fish_eza_install
end
