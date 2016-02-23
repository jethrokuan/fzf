function __fzf_ctrl_t
  set -q FZF_CTRL_T_COMMAND; or set -l FZF_CTRL_T_COMMAND "
  command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  eval $FZF_CTRL_T_COMMAND | eval (__fzfcmd) -m | read -laz selects
  and commandline -i (echo $selects | tr "\n" " ")
  commandline -f repaint
end