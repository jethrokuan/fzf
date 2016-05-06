function __fzf_uninstall
    printf "Uninstalling fzf...\n"
    if test -e "$HOME/.fzf"
        pushd "$HOME/.fzf"
        ./uninstall > /dev/null ^ /dev/null
        popd
        rm -rf "$HOME/.fzf"
        printf "fzf uninstalled."
    else
        printf "fzf not installed in ~/.fzf"
    end

    for i in (seq (count $fish_user_paths))
        if test "$fish_user_paths[$i]" = "$HOME/.fzf/bin"
            set -e fish_user_paths[$i]
            break
        end
    end
end
