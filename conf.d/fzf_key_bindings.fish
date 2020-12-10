if test "$FZF_DISABLE_KEYBINDINGS" -ne 1
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd --hidden'
        bind \cg '__fzf_open'
        bind \co '__fzf_open --editor'

        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd --hidden'
            bind -M insert \cg '__fzf_open'
            bind -M insert \co '__fzf_open --editor'
        end
    else
        bind \co '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd --hidden'
        bind \eO '__fzf_open'
        bind \eo '__fzf_open --editor'

        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \co '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd --hidden'
            bind -M insert \eO '__fzf_open'
            bind -M insert \eo '__fzf_open --editor'
        end
    end

    if ! bind --user \t >/dev/null 2>/dev/null
        if set -q FZF_COMPLETE
            bind \t '__fzf_complete'
            if bind -M insert >/dev/null 2>/dev/null
                bind -M insert \t '__fzf_complete'
            end
        end
    end
end

function fzf_key_bindings_uninstall -e fzf_key_bindings_uninstall
    bind --user \
        | string replace --filter --regex -- "bind (.+)( '?__fzf.*)" 'bind -e $1' \
        | source
end
