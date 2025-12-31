<div align="center">
  <img alt="fish-eza" src="./assets/logo.png" width="200" />
</div>

# fish-eza

Adaptation of [z-shell/zsh-eza](https://github.com/z-shell/zsh-eza) for the Fish shell.

### Installation

Install with [fisher](https://github.com/jorgebucaran/fisher):

```shell
fisher install givensuman/fish-eza
```

### Environment variables

| Variable      | Description                             | Default                                                                                   |
| ------------- | --------------------------------------- | ----------------------------------------------------------------------------------------- |
| eza_params    | `eza` params to be used with every call | `--git --icons --group --group-directories-first --time-style=long-iso --color-scale=all` |
| eza_run_on_cd | automatically run on `cd`               | _undefined_                                                                               |

Set `eza_run_on_cd` to anything to enable, e.g. `set -gx eza_run_on_cd true`

### Aliases

```shell
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'
```

### Requirements

Just requires [eza](https://github.com/eza-community/eza)!

### License

[MIT](../LICENSE)
