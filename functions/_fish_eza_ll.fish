# alias ll='eza --all --header --long $eza_params'
function _fish_eza_ll --wraps _fish_eza_ls
    _fish_eza_ls --all --header --long $argv
end
