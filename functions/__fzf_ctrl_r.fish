function __fzf_ctrl_r
    if not type -q fzf
        printf "fzf not yet installed. Installing now, please wait..."
        __fzf_install
        commandline -f repaint
        __fzf_ctrl_r
    else
        history | __fzfcmd +s +m --tiebreak=index --toggle-sort=ctrl-r | read -l select

        and commandline -rb $select
        commandline -f repaint
    end
end
