# Long listing format with all files and header
function _fish_eza_ll --wraps _fish_eza_ls
    _fish_eza_ls --all --header --long $argv
end
