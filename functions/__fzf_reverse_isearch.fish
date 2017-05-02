function __fzf_reverse_isearch
  builtin history --null | eval "__fzfcmd --read0 +s --tiebreak=index --toggle-sort=ctrl-r $FZF_DEFAULT_OPTS $FZF_REVERSE_ISEARCH_OPTS -q (commandline)" | read -z select
  if not test -z $select
    commandline -rb (builtin string trim "$select")
    commandline -f repaint
  end
end
