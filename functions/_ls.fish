# `eza` wrapper with parameter handling
function _ls
    if set -q eza_params
        eza $eza_params $argv
    else
        set -lx params --git \
            --icons \
            --group \
            --group-directories-first \
            --time-style=long-iso \
            --color-scale=all

        eza $params $argv
    end
end
