# Fzf

[![Slack Room][slack-badge]][slack-link]

**fzf** provides efficient keybindings for the [fzf](https://github.com/junegunn/fzf) utility. Heavily adapted from @hauleth's PR.

## Install

With [fisherman]

```
fisher fzf
```

## Notes

* Required fish version: `>=2.4.0`
* Compatible fzf versions: `>0.11.3`

## FZF binary
This plugin will fail if the `fzf` binary is not detected in your `PATH`.

The recommended means of installing `fzf` is through your respective
package managers. 

## Usage

| Legacy      | New Keybindings   | Remarks                                                       |
| -------     | ----------------- | ------------------------------------------------------------- |
| Ctrl-t      | Ctrl-f            | Find a file.                                                  |
| Ctrl-r      | Ctrl-r            | Search through command history.                               |
| Alt-c       | Alt-o             | cd into sub-directories (recursively searched).               |
| Alt-Shift-c | Alt-Shift-o       | cd into sub-directories, including hidden ones.               |
| Ctrl-o      | Ctrl-o            | Open a file/dir using default editor ($EDITOR)                |
| Ctrl-g      | Ctrl-g            | Open a file/dir using xdg-open or open command                |

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
| Variable                       | Remarks                                               | Example                                                       |
| ------------------------------ | ----------------------------------------------------- | ------------------------------------------------------------- |
| `FZF_FIND_FILE_COMMAND`        | Modify the command used to generate the list of files | `set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git"` |
| `FZF_CD_COMMAND`               | Similar to ^                                          | Similar to ^                                                  |
| `FZF_CD_WITH_HIDDEN_COMMAND`   | Similar to ^                                          | Similar to ^                                                  |
| `FZF_FIND_AND_EXECUTE_COMMAND` | Similar to ^                                          | Similar to ^                                                  |
| `FZF_REVERSE_ISEARCH_COMMAND`  | Similar to ^                                          | Similar to ^                                                  |
| `FZF_OPEN_COMMAND`             | Similar to ^                                          | Similar to ^                                                  |

## Variables
| Variable                    | Remarks                                                        | Example                                               |
| --------------------------- | -------------------------------------------------------------- | ----------------------------------------------------  |
| `FZF_DEFAULT_OPTS`          | Default options passed to every fzf command                    | `set -U FZF_DEFAULT_OPTS "--height 40"`               |
| `FZF_FIND_FILE_OPTS`        | Pass in additional arguments to the fzf command for find file  | `set -U FZF_FIND_FILE_OPTS "--reverse --inline-info"` |
| `FZF_CD_OPTS`               | Similar to ^                                                   | Similar to ^                                          |
| `FZF_CD_WITH_HIDDEN_OPTS`   | Similar to ^                                                   | Similar to ^                                          |
| `FZF_FIND_AND_EXECUTE_OPTS` | Similar to ^                                                   | Similar to ^                                          |
| `FZF_REVERSE_ISEARCH_OPTS`  | Similar to ^                                                   | Similar to ^                                          |
| `FZF_OPEN_OPTS`             | Similar to ^                                                   | Similar to ^                                          |
| `FZF_TMUX`                  | Runs a tmux-friendly version of fzf instead.                   | `set -U FZF_TMUX 1`                                   |
| `FZF_COMPLETE`              | Enable fzf for fish tab completion.                            | `set -U FZF_COMPLETE 1`                               |

[tmux]:https://tmux.github.io/
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
