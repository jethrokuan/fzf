if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
    bind \ct '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ec '__fzf_cd'
    bind \eC '__fzf_cd_with_hidden'

    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \ct '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd_with_hidden'
    end
else
    bind \cf '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ex '__fzf_find_and_execute'
    bind \eo '__fzf_cd'
    bind \eO '__fzf_cd --hidden'

    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cf '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \eo '__fzf_cd'
        bind -M insert \eO '__fzf_cd --hidden'
    end
end

set -q FZF_COMPLETE ;and bind \t '__fzf_complete'
