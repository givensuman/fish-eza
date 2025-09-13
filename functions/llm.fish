# alias llm='eza --all --header --long --sort=modified $eza_params'
function llm --wraps _ls
    _ls --sort=modified $argv
end
