function __fzf_ctrl_x
  if not type -q fzf
    __fzf_install
    return
  else
    history | __fzfcmd +s +m --tiebreak=index --toggle-sort=ctrl-r | read -l select
    and echo "
    ------
    Running command: $select
    ------"
    and eval $select
    commandline -f repaint
  end
end
