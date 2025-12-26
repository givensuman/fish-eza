# alias llm='eza --all --header --long --sort=modified $eza_params'
function _fish_eza_llm --wraps _ls
    _ls --sort=modified $argv
end
