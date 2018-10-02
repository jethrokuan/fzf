function __fzf_open -d "Open files and directories."
    function __fzf_open_get_open_cmd -d "Find appropriate open command."
        if type -q xdg-open
            echo "xdg-open"
        else if type -q open
            echo "open"
        end
    end

    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    set -l options "e/editor" "p/preview=?"

    argparse $options -- $argv

    set -l preview_cmd
    if set -q _flag_preview
        echo "Hello" $_flag_preview
        set -l preview_pager_cmd
        if test -n "$_flag_preview"
            echo "not empty" $_flag_preview
            set preview_pager_cmd $_flag_preview
        else
            echo "empty" $_flag_preview
            set preview_pager_cmd "head -100 {}"
        end
        set preview_cmd "--preview \"if test -d {}; ls --color=always -Al {}; else; $preview_pager_cmd; end\""
        echo $preview_cmd
    end

    set -q FZF_OPEN_COMMAND
    or set -l FZF_OPEN_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's@^\./@@'"

    eval "$FZF_OPEN_COMMAND | "(__fzfcmd) "$preview_cmd -m $FZF_DEFAULT_OPTS $FZF_OPEN_OPTS --query \"$fzf_query\"" | read -l select

    # set how to open
    set -l open_cmd
    if set -q _flag_editor
        set open_cmd "$EDITOR"
    else
        set open_cmd (__fzf_open_get_open_cmd)
        if test -z "$open_cmd"
            echo "Couldn't find appropriate open command to use. Do you have 'xdg-open' or 'open' installed?"; and return 1
        end
    end

    set -l open_status 0
    if not test -z "$select"
        commandline "$open_cmd $select" ;and commandline -f execute
        set open_status $status
    end

    commandline -f repaint
    return $open_status
end
