set -q FZF_LEGACY_KEYBINDINGS
or set -l FZF_LEGACY_KEYBINDINGS 1

if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
    bind \ct '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \cx '__fzf_find_and_execute'
    bind \ec '__fzf_cd'
    bind \eC '__fzf_cd_with_hidden'

    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \ct '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \cx '__fzf_find_and_execute'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd_with_hidden'
    end
else
    bind \cf '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ex '__fzf_find_and_execute'
    bind \ed '__fzf_cd'
    bind \eD '__fzf_cd_with_hidden'

    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cf '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ex '__fzf_find_and_execute'
        bind -M insert \ed '__fzf_cd'
        bind -M insert \eD '__fzf_cd_with_hidden'
    end
end
