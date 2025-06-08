# `eza` wrapper with parameter handling
function _ls --wraps eza
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
