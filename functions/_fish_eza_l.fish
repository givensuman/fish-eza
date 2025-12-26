# alias l='eza --git-ignore $eza_params'
function _fish_eza_l --wraps _ls
    _ls --git-ignore $argv
end
