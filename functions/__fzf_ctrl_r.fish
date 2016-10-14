function __fzf_ctrl_r
  __fish_history | __fzfcmd +s --tiebreak=index --toggle-sort=ctrl-r -q (commandline) $FZF_CTRL_R_OPTS | read -l select; and
  commandline -rb (printf $select)
  commandline -f repaint
end
