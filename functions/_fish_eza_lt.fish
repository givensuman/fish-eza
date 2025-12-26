# alias lt='eza --tree $eza_params'
function _fish_eza_lt --wraps _ls
    _ls --tree --level=2 $argv
end
