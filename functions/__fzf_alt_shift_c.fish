function __fzf_alt_shift_c
  set -q FZF_ALT_SHIFT_C_COMMAND
  or set -l FZF_ALT_SHIFT_C_COMMAND "
  command find -L . \
  \\( -path '*/\\.git*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
  -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
  # Fish hangs if the command before pipe redirects (2> /dev/null)
  fish -c "$FZF_ALT_SHIFT_C_COMMAND" | __fzfcmd -m $FZF_ALT_SHIFT_C_OPTS | \
    read -la select
  if test ! (count $select) -eq 0
    cd $select
  end
  commandline -f repaint
end
