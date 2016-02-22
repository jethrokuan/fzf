function __fzf_ctrl_r
  history | eval (__fzfcmd) +s +m --tiebreak=index --toggle-sort=ctrl-r > $TMPDIR/fzf.result
  and commandline (cat $TMPDIR/fzf.result)
  commandline -f repaint
  rm -f $TMPDIR/fzf.result
end