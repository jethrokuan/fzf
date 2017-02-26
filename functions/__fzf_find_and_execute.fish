function __fzf_find_and_execute
  __fish_history | __fzfcmd +s -m $FZF_DEFAULT_OPTS $FZF_FIND_AND_EXECUTE_OPTS --tiebreak=index --toggle-sort=ctrl-r | read -l select
  printf "\nexecuting: $select\n"
  eval $select
  commandline -f repaint
end
