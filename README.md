[![Slack Room][slack-badge]][slack-link]

# Fzf

**fzf** provides efficient keybindings for the [fzf](https://github.com/junegunn/fzf) utility. Heavily adapted from @hauleth's PR.

## Install

With [fisherman]

```
fisher fzf
```

## Notes

* Required fish version: `>=2.2.0`
* Compatible fzf versions: `>0.11.3`

## FZF binary
If the fzf binary is not detected in PATH, activating the key bindings will attempt to install it. The install directory is `$HOME/.fzf`.

If you wish to uninstall this binary at a later point, I've included an installer that should properly clean it away.

Note that the binary is installed only for the current user.

## Usage

- Ctrl-t: file finder (multi-select enabled)
- Ctrl-r: search past commands
- Ctrl-x: execute past commands without confirmation
- Alt-c: cd into directories

## Variables

### `FZF_TMUX`

If you're a [tmux] user, run `set -U FZF_TMUX 1`. This makes fish run the more tmux-compatible `fzf-tmux`.

[tmux]:https://tmux.github.io/
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
