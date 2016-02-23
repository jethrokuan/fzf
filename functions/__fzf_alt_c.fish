function __fzf_alt_c
  set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "
  command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
  # Fish hangs if the command before pipe redirects (2> /dev/null)
  eval $FZF_ALT_C_COMMAND | eval (__fzfcmd) +m | read -l fzf_last_select [$fzf_last_select]
  if test ! -z "$fzf_last_select"
    cd $fzf_last_select
  end
  commandline -f repaint
end