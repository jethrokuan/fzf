function __fzf_find_and_execute
  builtin history --null | __fzfcmd --read0 +s -m $FZF_DEFAULT_OPTS $FZF_FIND_AND_EXECUTE_OPTS --tiebreak=index --toggle-sort=ctrl-r | read -z select
  printf "\nexecuting: $select\n"
  eval $select
  commandline -f repaint
end
