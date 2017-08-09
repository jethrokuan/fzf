function __fzf_cd
  set -q FZF_CD_COMMAND
  or set -l FZF_CD_COMMAND "
  command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
  -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
  # Fish hangs if the command before pipe redirects (2> /dev/null)
  eval "$FZF_CD_COMMAND" | eval "__fzfcmd -m $FZF_DEFAULT_OPTS $FZF_CD_OPTS" | read -l select
  if not test -z "$select"
    cd "$select"
  end
  commandline -f repaint
end
