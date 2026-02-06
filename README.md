<div align="center">
  <img alt="fish-eza" src="./assets/logo.png" height="200" />
</div>

# fish-eza

A port of [z-shell/zsh-eza](https://github.com/z-shell/zsh-eza) for the Fish shell.

### Installation

Install with [fisher](https://github.com/jorgebucaran/fisher):

```shell
fisher install givensuman/fish-eza
```

### Usage

Replaces `ls` with `eza`. To run the normal `ls` command, use `rls`.

### Environment variables

| Variable      | Description                                | Default                                                                                   |
| ------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------- |
| eza_params    | `eza` params to be used with every call    | `--git --icons --group --group-directories-first --time-style=long-iso --color-scale=all` |
| eza_run_on_cd | automatically run on `cd`; any value works | undefined                                                                                 |

### Aliases

| Alias | Command                                     | Description                                   |
| ----- | ------------------------------------------- | --------------------------------------------- |
| la    | `eza -lbhHigUmuSa`                          | List all with details                         |
| lx    | `eza -lbhHigUmuSa@`                         | List all, with additional file attributes     |
| l     | `eza --git-ignore`                          | List files respecting .gitignore              |
| ll    | `eza --all --header --long`                 | Long listing format with all files and header |
| llm   | `eza --all --header --long --sort=modified` | Long listing sorted by modification time      |
| lt    | `eza --tree --level=2`                      | Tree view with 2-level depth limit            |
| tree  | `eza --tree`                                | Tree view with unlimited depth                |

### Requirements

Just requires [eza](https://github.com/eza-community/eza)!

### License

[MIT](./LICENSE)
