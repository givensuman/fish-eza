# Automatically run `ls` when `$eza_run_on_cd` is set
function _auto_ls --on-variable PWD
    if status is-interactive
        if set -q eza_run_on_cd
            _ls
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
alias ls _ls

alias la 'eza -lbhHigUmuSa'
alias lx 'eza -lbhHigUmuSa@'

function _fish_eza_install --on-event fish-eza_install
end

function _fish_eza_uninstall --on-event fish-eza_uninstall
    functions --erase _auto_ls

    functions --erase ls
    functions --erase la
    functions --erase lx

    set --erase eza_params
    set --erase eza_run_on_cd
end

function _fish_eza_update --on-event fish-eza_update
    _fish_eza_uninstall
    _fish_eza_install
end
