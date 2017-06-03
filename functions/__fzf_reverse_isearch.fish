function __fzf_reverse_isearch
  builtin history | eval "__fzfcmd +s --tiebreak=index --toggle-sort=ctrl-r $FZF_DEFAULT_OPTS $FZF_REVERSE_ISEARCH_OPTS -q (commandline)" | read select
  if not test -z $select
    commandline -rb "$select"
    commandline -f repaint
  end
end
