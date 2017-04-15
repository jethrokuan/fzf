function __fzf_reverse_isearch
  builtin history --null | __fzfcmd --read0 +s --tiebreak=index --toggle-sort=ctrl-r -q (commandline) $FZF_DEFAULT_OPTS $FZF_REVERSE_ISEARCH_OPTS | read -z select
  if not test -z $select
    commandline -rb (builtin string trim "$select")
    commandline -f repaint
  end
end
