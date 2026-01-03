# alias lt='eza --tree $eza_params'
function _fish_eza_lt --wraps _fish_eza_ls
    _fish_eza_ls --tree --level=2 $argv
end
