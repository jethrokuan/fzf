function __fzfcmd
  if not set -q FZF_TMUX
    set FZF_TMUX 0
  end
  if test $FZF_TMUX -eq 1
    if set -q FZF_TMUX_HEIGHT
      echo "fzf-tmux -d$FZF_TMUX_HEIGHT"
    else
      echo "fzf-tmux -d40%"
    end
  else
    echo "fzf"
  end
end