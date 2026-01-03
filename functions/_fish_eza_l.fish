# alias l='eza --git-ignore $eza_params'
function _fish_eza_l --wraps _fish_eza_ls
    _fish_eza_ls --git-ignore $argv
end
