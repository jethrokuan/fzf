function __fzf_ctrl_x
  history | eval (__fzfcmd) +s +m --tiebreak=index --toggle-sort=ctrl-r | read -l select
  and echo "
------
Running command: $select
------"
  and eval $fzf_last_select
  commandline -f repaint
end