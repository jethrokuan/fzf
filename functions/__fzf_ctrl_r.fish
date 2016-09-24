function __fzf_ctrl_r
  history | __fzfcmd +s --tiebreak=index --toggle-sort=ctrl-r -q (commandline) | read -l select

  and commandline -rb $select
  commandline -f repaint
end
