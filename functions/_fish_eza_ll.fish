# alias ll='eza --all --header --long $eza_params'
function _fish_eza_ll --wraps _ls
    _ls --all --header --long $argv
end
