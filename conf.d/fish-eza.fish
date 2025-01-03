function _fish_eza_install --on-event fish-eza_install
    # Automatically run `ls` when `$eza_run_on_cd` is set
    function _auto_ls --on-variable PWD
        if set -q eza_run_on_cd
            # argv is overridden by parent function
            # so we spread ...$eza_params over local
            # _ls ...$params
            _ls $eza_params
        end
    end

    # Handle dumb terminal case
    if test "$TERM" = dumb
        echo "you are sourcing the fish plugin for eza"
        echo "in a dumb terminal, which won't support it"

        return 1
    end

    if command -q eza
        function _ls
            set -lx params --git \
                --icons \
                --group \
                --group-directories-first \
                --time-style=long-iso \
                --color-scale=all

            if set -q eza_params
                set -lx params $eza_params
            end

            eza $argv $params
        end

        alias ls="_ls"
        alias l="_ls --git-ignore"
        alias ll="_ls --all --header --long"
        alias llm="_ls --all --header --long --sort=modified"
        alias la="eza -lbhHigUmuSa" # ignore `$params`
        alias lx="eza -lbhHigUmuSa@" # ignore `$params`
        alias lt="_ls --tree"
        alias tree="_ls --tree"

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
    functions --erase la
    functions --erase lx
    functions --erase lt
    functions --erase tree

    functions --erase _ls
    functions --erase _auto_ls

    set --erase eza_params
    set --erase eza_run_on_cd
end

function _fish_eza_update --on-event fish-eza_update
    _fish_eza_uninstall
    _fish_eza_install
end
