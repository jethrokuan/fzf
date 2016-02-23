function __fzf_ctrl_r
  history | eval (__fzfcmd) +s +m --tiebreak=index --toggle-sort=ctrl-r | read -l fzf_last_select [$fzf_last_select];
  and commandline -rb $fzf_last_select
  commandline -f repaint
end