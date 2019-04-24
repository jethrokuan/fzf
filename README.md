# Fzf

Integrate [fzf](https://github.com/junegunn/fzf) functionality into [fish](https://github.com/fish-shell/fish-shell)! Includes handy functions to do the following using `fzf`

- command tab completion
- search command history
- find and cd into sub-directories
- find and open files

All functions

- are lazily-loaded to keep shell startup time down
- have preset but configurable key bindings

Heavily adapted from @hauleth's PR.

Note that the `fzf` utility has its [own out-of-the-box fish package](https://github.com/junegunn/fzf/blob/master/shell/key-bindings.fish). What sets this package apart is that it has a couple more integrations, most notably tab completion, and will probably be updated more frequently. They are not compatible so either use one or the other.

## Installation

With [fisher]

```
fisher add jethrokuan/fzf
```

With [oh-my-fish]

```
omf install https://github.com/jethrokuan/fzf
```

## Requirements

- [fish](https://github.com/fish-shell/fish-shell) `>=2.4.0`
- [fzf](https://github.com/junegunn/fzf) `>0.11.3`

## About the fzf binary

This package will fail if the `fzf` binary is not detected in your `PATH`.

See the [fzf documentation](https://github.com/junegunn/fzf#installation) for instructions to install `fzf` on your system.

## Usage

| Legacy      | New Keybindings | Remarks                                         |
| ----------- | --------------- | ----------------------------------------------- |
| Ctrl-t      | Ctrl-f          | Find a file.                                    |
| Ctrl-r      | Ctrl-r          | Search through command history.                 |
| Alt-c       | Alt-o           | cd into sub-directories (recursively searched). |
| Alt-Shift-c | Alt-Shift-o     | cd into sub-directories, including hidden ones. |
| Ctrl-o      | Ctrl-o          | Open a file/dir using default editor ($EDITOR)  |
| Ctrl-g      | Ctrl-g          | Open a file/dir using xdg-open or open command  |

Legacy keybindings are kept by default, but these have conflict with
keybindings in fish 2.4.0. If you want to use the new keybindings,
enter the following into your terminal:

```
set -U FZF_LEGACY_KEYBINDINGS 0
```

NOTE: On OS X, Alt-c (Option-c) types ç by default. In iTerm2, you can
send the right escape sequence with Esc-c. If you configure the option
key to act as +Esc (iTerm2 Preferences > Profiles > Default > Keys >
Left option (⌥) acts as: > +Esc), then alt-c will work for fzf as
documented.

## Commands

| Variable                       | Remarks                                                     | Example                                                       |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------- |
| `FZF_FIND_FILE_COMMAND`        | Modify the command used to generate the list of files       | `set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"` or `set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"` (`$dir` represents the directory being completed) |
| `FZF_CD_COMMAND`               | Similar to ^                                                | Similar to ^                                                  |
| `FZF_CD_WITH_HIDDEN_COMMAND`   | Similar to ^                                                | Similar to ^                                                  |
| `FZF_OPEN_COMMAND`             | Similar to ^                                                | Similar to ^                                                  |
| `FZF_PREVIEW_FILE_CMD`     | Modify the command used to generate preview of files.       | `set -U FZF_PREVIEW_FILE_CMD "head -n 10"`                |
| `FZF_PREVIEW_DIR_CMD`      | Modify the command used to generate preview of directories. | `set -U FZF_PREVIEW_DIR_CMD "ls"`                        |

## Variables

| Variable                    | Remarks                                                       | Example                                               |
| --------------------------- | ------------------------------------------------------------- | ----------------------------------------------------- |
| `FZF_DEFAULT_OPTS`          | Default options passed to every fzf command                   | `set -U FZF_DEFAULT_OPTS "--height 40"`               |
| `FZF_FIND_FILE_OPTS`        | Pass in additional arguments to the fzf command for find file | `set -U FZF_FIND_FILE_OPTS "--reverse --inline-info"` |
| `FZF_CD_OPTS`               | Similar to ^                                                  | Similar to ^                                          |
| `FZF_CD_WITH_HIDDEN_OPTS`   | Similar to ^                                                  | Similar to ^                                          |
| `FZF_REVERSE_ISEARCH_OPTS`  | Similar to ^                                                  | Similar to ^                                          |
| `FZF_OPEN_OPTS`             | Similar to ^                                                  | Similar to ^                                          |
| `FZF_COMPLETE_OPTS`         | Similar to ^                                                  | Similar to ^                                          |
| `FZF_TMUX`                  | Runs a tmux-friendly version of fzf instead.                  | `set -U FZF_TMUX 1`                                   |
| `FZF_ENABLE_OPEN_PREVIEW`   | Enable preview window open command.                           | `set -U FZF_ENABLE_OPEN_PREVIEW 1`                    |

## FZF Tab Completions
This package ships with a `fzf` widget for fancy tab completions.
Please see [the wiki
page](https://github.com/jethrokuan/fzf/wiki/FZF-Tab-Completions) for details.

###
[tmux]: https://tmux.github.io/
[fisher]: https://github.com/jorgebucaran/fisher
[oh-my-fish]: https://github.com/oh-my-fish/oh-my-fish

## License

fzf is MIT licensed. See the [LICENSE](LICENSE.md) for details.
