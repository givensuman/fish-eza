# alias lt='eza --tree $eza_params'
function lt --wraps _ls
    _ls --tree --level=2 $argv
end
