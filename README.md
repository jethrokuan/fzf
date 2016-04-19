[![Slack Room][slack-badge]][slack-link]

# Fzf

**fzf** provides efficient keybindings for the [fzf](https://github.com/junegunn/fzf) utility. Heavily adapted from @hauleth's PR.

## Install

Minimum fish version: `2.2.0`
Compatible fzf versions: `0.11.3`

_That's the fzf version I'm using, and it works. If anyone gets it working on other versions, feel free to let me know/make a PR here._

With [fisherman]

```
fisher i fzf
```

With [fin]

```
fin fzf
```

## Usage
- Ctrl-t: file finder (multi-select enabled)
- Ctrl-r: search past commands
- Ctrl-x: execute past commands without confirmation
- Alt-c: cd into directories

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://img.shields.io/badge/slack-join%20the%20chat-00B9FF.svg?style=flat-square
[fisherman]: https://github.com/fisherman/fisherman
[fin]: https://github.com/fisherman/fin

## Variables

### `FZF_TMUX`
If you're a [tmux] user, run `set -U FZF_TMUX 1`. This makes fish run the more tmux-compatible `fzf-tmux`.


## License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[tmux]:https://tmux.github.io/
