# Tree view with unlimited depth
function _fish_eza_tree --wraps _fish_eza_ls
    _fish_eza_ls --tree $argv
end
