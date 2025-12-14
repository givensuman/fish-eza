# alias ll='eza --all --header --long $eza_params'
function ll --wraps _ls
    _ls --all --header --long $argv
end
