function __fzf_ctrl_x
  history | eval (__fzfcmd) +s +m --tiebreak=index --toggle-sort=ctrl-r | read -l fzf_last_select [$fzf_last_select];
  and echo "
------
Running command: $fzf_last_select
------"
  and eval $fzf_last_select
  commandline -f repaint
end