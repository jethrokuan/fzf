function __fzf_complete_preview -d 'generate preview for completion widget.
    argv[1] is the currently selected candidate in fzf
    argv[2] is a string containing the rest of the output produced by `complete -Ccmd`
    '

    if test "$argv[2]" = "Redefine variable"
        # show environment variables current value
        set -l evar (echo $argv[1] | cut -d= -f1)
        echo $argv[1]$$evar
    else
        echo $argv[1]
    end

    # list directories on preview
    if test -d "$argv[1]"
        eval $FZF_PREVIEW_DIR_CMD (string escape $argv[1])
    end

    # show ten lines of non-binary files preview
    if test -f "$argv[1]"; and grep -qI . "$argv[1]"
        eval $FZF_PREVIEW_FILE_CMD (string escape $argv[1])
    end

    # if fish knows about it, let it show info
    type -q "$argv[1]" 2>/dev/null; and type -a "$argv[1]"

    # show aditional data
    echo $argv[2]
end
