# Long listing sorted by modification time
function _fish_eza_llm --wraps _fish_eza_ls
    _fish_eza_ls --all --header --long --sort=modified $argv
end
