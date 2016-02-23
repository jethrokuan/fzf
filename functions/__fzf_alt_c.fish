function __fzf_alt_c
  set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "
  command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
  # Fish hangs if the command before pipe redirects (2> /dev/null)
  eval $FZF_ALT_C_COMMAND | eval (__fzfcmd) +m | read -l select [$select]
  if test ! -z "$select"
    cd $fselect
  end
  commandline -f repaint
end