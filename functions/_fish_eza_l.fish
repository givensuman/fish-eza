# alias l='eza --git-ignore $eza_params'
function l --wraps _ls
    _ls --git-ignore $argv
end
