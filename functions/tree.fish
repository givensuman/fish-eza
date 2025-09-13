# alias tree='eza --tree $eza_params'
function tree --wraps _ls
    _ls --tree $argv
end
