# `eza` wrapper with parameter handling
function _fish_eza_ls --wraps eza
    if set -q eza_params; and test -n "$eza_params"
        set -l params (string split ' ' -- $eza_params)

        command eza $params $argv
    else
        command eza --git \
            --icons \
            --group \
            --group-directories-first \
            --time-style=long-iso \
            --color-scale=all \
            $argv
    end
end

# Automatically run `ls` when `$eza_run_on_cd` is set
function _fish_eza_auto_ls --on-variable PWD
    if status is-interactive
        if set -q eza_run_on_cd
            _fish_eza_ls
        end
    end
end

if not command -q eza
    echo "eza is not installed but you're"
    echo "sourcing the fish plugin for it"

    return 1
end

# Handle dumb terminal case
if test "$TERM" = dumb
    echo "you are sourcing the fish plugin for eza"
    echo "in a dumb terminal, which won't support it"

    return 1
end

# see ../functions/_fish_eza__ls.fish
alias ls _fish_eza_ls

alias la 'eza -lbhHigUmuSa'
alias lx 'eza -lbhHigUmuSa@'
alias l _fish_eza_l
alias ll _fish_eza_ll
alias llm _fish_eza_llm
alias lt _fish_eza_lt
alias tree _fish_eza_tree

function _fish_eza_install --on-event fish-eza_install
end

function _fish_eza_uninstall --on-event fish-eza_uninstall
    functions --erase _fish_eza_auto_ls

    functions --erase _fish_eza_ls
    functions --erase ls

    functions --erase la
    functions --erase lx
    functions --erase la
    functions --erase lx
    functions --erase l
    functions --erase ll
    functions --erase llm
    functions --erase lt

    set --erase eza_params
    set --erase eza_run_on_cd
end

function _fish_eza_update --on-event fish-eza_update
    _fish_eza_uninstall
    _fish_eza_install
end
