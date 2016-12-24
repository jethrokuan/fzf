function __fzf_uninstall
    printf "Uninstalling fzf...\n"
    if test -e "$FZF_DIR"
        pushd "$FZF_DIR"
        ./uninstall > /dev/null ^ /dev/null
        popd
        rm -rf "$FZF_DIR"
        printf "fzf uninstalled."
    else
        printf "fzf not installed in ~/.fzf"
    end

    for i in (seq (count $fish_user_paths))
      if test "$fish_user_paths[$i]" = "$FZF_DIR/bin"
        set -e fish_user_paths[$i]
        break
        end
    end
end
