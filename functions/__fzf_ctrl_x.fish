function __fzf_ctrl_x
    if not type -q fzf
        printf "fzf not yet installed. Installing now, please wait..."
        __fzf_install
        commandline -f repaint
        __fzf_ctrl_x
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
