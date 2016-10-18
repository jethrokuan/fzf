bind \ct '__fzf_ctrl_t'
bind \cr '__fzf_ctrl_r'
bind \cx '__fzf_ctrl_x'
bind \ec '__fzf_alt_c'
bind \eC '__fzf_alt_shift_c'

if bind -M insert > /dev/null ^ /dev/null
  bind -M insert \ct '__fzf_ctrl_t'
  bind -M insert \cr '__fzf_ctrl_r'
  bind -M insert \cx '__fzf_ctrl_x'
  bind -M insert \ec '__fzf_alt_c'
  bind -M insert \eC '__fzf_alt_shift_c'
end
