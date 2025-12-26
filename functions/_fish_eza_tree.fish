# alias tree='eza --tree $eza_params'
function _fish_eza_tree --wraps _ls
    _ls --tree $argv
end
