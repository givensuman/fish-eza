# alias tree='eza --tree $eza_params'
function _fish_eza_tree --wraps _fish_eza_ls
    _fish_eza_ls --tree $argv
end
