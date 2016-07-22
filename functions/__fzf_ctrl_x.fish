function __fzf_ctrl_x
  history | __fzfcmd +s +m --tiebreak=index --toggle-sort=ctrl-r | read -l select
  and echo "
  ------
  Running command: $select
  ------"
  and eval $select
  commandline -f repaint
end
