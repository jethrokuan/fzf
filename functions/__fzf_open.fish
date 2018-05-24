function __fzf_open -d "Open files and directories"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    set -l options "e/editor"

    argparse $options -- $argv

    set -q FZF_OPEN_COMMAND
    or set -l FZF_OPEN_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's@^\./@@'"

    eval "$FZF_OPEN_COMMAND | "(__fzfcmd) "-m $FZF_DEFAULT_OPTS $FZF_FIND_FILE_OPTS --query \"$fzf_query\"" | read -l select

    if not test -z "$select"
        if set -q _flag_editor
            echo "editor"
            eval "$EDITOR $select"
        else
            echo "open"
            open $select
        end
        commandline -t ""
    end

    commandline -f repaint
end
