function __fzf_find_and_execute
  builtin history | eval "__fzfcmd +s -m --tiebreak=index --toggle-sort=ctrl-r $FZF_DEFAULT_OPTS $FZF_FIND_AND_EXECUTE_OPTS" | read select
  printf "\nexecuting: $select\n"
  eval $select
  commandline -f repaint
end
