# Fzf

Integrate [fzf](https://github.com/junegunn/fzf) (command-line fuzzy finder) functionality into [Fish](https://github.com/fish-shell/fish-shell). Includes handy functions to:

- complete commands via <kbd>Tab</kbd>
- search command history
- find and `cd` into sub-directories
- find and open files

All functions:

- are lazily-loaded to keep shell startup time down
- have configurable key bindings

## Installation

### System Requirements

- [fzf](https://github.com/junegunn/fzf) >= `0.11.3`
- [Fish](https://github.com/fish-shell/fish-shell) >= `2.4.0`

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jethrokuan/fzf
```

## Quickstart

| Legacy      | New Keybindings | Remarks                                         |
| ----------- | --------------- | ----------------------------------------------- |
| Ctrl-t      | Ctrl-o          | Find a file.                                    |
| Ctrl-r      | Ctrl-r          | Search through command history.                 |
| Alt-c       | Alt-c           | cd into sub-directories (recursively searched). |
| Alt-Shift-c | Alt-Shift-c     | cd into sub-directories, including hidden ones. |
| Ctrl-o      | Alt-o           | Open a file/dir using default editor ($EDITOR)  |
| Ctrl-g      | Alt-Shift-o     | Open a file/dir using xdg-open or open command  |

Legacy keybindings are kept by default, but these have conflict with key bindings in Fish 2.4.0. If you want to use the new keybindings, ƒenter the following into your terminal:

```fish
set -U FZF_LEGACY_KEYBINDINGS 0
```

You can disable default keybindings altogether by running:

```fish
set -U FZF_DISABLE_KEYBINDINGS 1
```

> **Note:** On OS X, <kbd>Alt</kbd>+<kbd>C</kbd> (Option-C) types ç by default. In iTerm2, you can send the right escape sequence with <kbd>Esc</kbd>+<kbd>C</kbd>. If you configure the option key to act as +Esc (iTerm2 Preferences > Profiles > Default > Keys > Left option (⌥) acts as: > +Esc), then <kbd>Alt</kbd>+<kbd>C</kbd> will work for `fzf` as documented.

## Commands

| Variable                     | Remarks                                                     | Example                                                                                                                                                                                      |
| ---------------------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `FZF_FIND_FILE_COMMAND`      | Modify the command used to generate the list of files       | `set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"` or `set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"` (`$dir` represents the directory being completed) |
| `FZF_CD_COMMAND`             | Similar to ^                                                | Similar to ^                                                                                                                                                                                 |
| `FZF_CD_WITH_HIDDEN_COMMAND` | Similar to ^                                                | Similar to ^                                                                                                                                                                                 |
| `FZF_OPEN_COMMAND`           | Similar to ^                                                | Similar to ^                                                                                                                                                                                 |
| `FZF_PREVIEW_FILE_CMD`       | Modify the command used to generate preview of files.       | `set -U FZF_PREVIEW_FILE_CMD "head -n 10"`                                                                                                                                                   |
| `FZF_PREVIEW_DIR_CMD`        | Modify the command used to generate preview of directories. | `set -U FZF_PREVIEW_DIR_CMD "ls"`                                                                                                                                                            |

## Variables

| Variable                   | Remarks                                                       | Example                                               |
| -------------------------- | ------------------------------------------------------------- | ----------------------------------------------------- |
| `FZF_DEFAULT_OPTS`         | Default options passed to every fzf command                   | `set -U FZF_DEFAULT_OPTS "--height 40"`               |
| `FZF_FIND_FILE_OPTS`       | Pass in additional arguments to the fzf command for find file | `set -U FZF_FIND_FILE_OPTS "--reverse --inline-info"` |
| `FZF_CD_OPTS`              | Similar to ^                                                  | Similar to ^                                          |
| `FZF_CD_WITH_HIDDEN_OPTS`  | Similar to ^                                                  | Similar to ^                                          |
| `FZF_REVERSE_ISEARCH_OPTS` | Similar to ^                                                  | Similar to ^                                          |
| `FZF_OPEN_OPTS`            | Similar to ^                                                  | Similar to ^                                          |
| `FZF_COMPLETE_OPTS`        | Similar to ^                                                  | Similar to ^                                          |
| `FZF_TMUX`                 | Runs a tmux-friendly version of fzf instead.                  | `set -U FZF_TMUX 1`                                   |
| `FZF_ENABLE_OPEN_PREVIEW`  | Enable preview window open command.                           | `set -U FZF_ENABLE_OPEN_PREVIEW 1`                    |

## `fzf` Tab Completions

This package ships with a `fzf` widget for fancy tab completions.

Please see [the wiki page](https://github.com/jethrokuan/fzf/wiki/FZF-Tab-Completions) for details.

## Alternatives

- [fzf.fish](https://github.com/patrickf3139/fzf.fish) is a newer fzf plugin with very similar features. It lacks fzf tab completion but includes functions for searching git log, git status, and browsing shell variables using fzf. Additionally, it is more likely to be maintained going forward. You can read more about the differences between it and this plugin on this `fzf.fish` [Wiki page](https://github.com/PatrickF1/fzf.fish/wiki/Prior-Art).
- The `fzf` utility ships with its [own out-of-the-box Fish integration](https://github.com/junegunn/fzf/blob/master/shell/key-bindings.fish). What sets this package apart is that it has better shell integration, most notably tab completions. They are not compatible so use one or the other.

[tmux]: https://tmux.github.io/

## License

[MIT](LICENSE.md)
