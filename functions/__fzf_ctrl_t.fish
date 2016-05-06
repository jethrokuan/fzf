function __fzf_ctrl_t
    if not type -q fzf
        printf "fzf not yet installed. Installing now, please wait..."
        __fzf_install
        commandline -f repaint
        __fzf_ctrl_t
    else
        set -q FZF_CTRL_T_COMMAND
        or set -l FZF_CTRL_T_COMMAND "
    command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
        eval "$FZF_CTRL_T_COMMAND" | __fzfcmd -m | __fzfescape | read -l selects
        and commandline -i "$selects"
        commandline -f repaint
    end
end
