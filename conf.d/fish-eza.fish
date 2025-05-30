function ls
    _ls $argv
end

# Automatically run `ls` when `$eza_run_on_cd` is set
function _autols --on-event fish_postexec
    if set -q eza_run_on_cd
        set -q _eza_last_dir; or set -g _eza_last_dir $PWD

        test "$PWD" = "$_eza_last_dir"; and return 0
        set _eza_last_dir $PWD

        ls
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

        # see ../functions/ls.fish
        alias l ls --git-ignore
        alias ll ls --all --header --long
        alias llm ls --all --header --long --sort=modified
        alias la eza -lbhHigUmuSa # ignore `$params`
        alias lx eza -lbhHigUmuSa@ # ignore `$params`
        alias lt ls --tree
        alias tree ls --tree

    else # `eza` command not found
        echo "eza is not installed but you're"
        echo "sourcing the fish plugin for it"

        return 1
    end
end

function _fish_eza_uninstall --on-event fish-eza_uninstall
    functions --erase l
    functions --erase ll
    functions --erase llm
    functions --erase la
    functions --erase lx
    functions --erase lt
    functions --erase tree

    functions --erase _ls
    functions --erase ls
    functions --erase _autols

    set --erase eza_params
    set --erase eza_run_on_cd

    set --erase _eza_last_dir
end

function _fish_eza_update --on-event fish-eza_update
    _fish_eza_uninstall
    _fish_eza_install
end
