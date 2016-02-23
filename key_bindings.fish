bind \ct '__fzf_ctrl_t'
bind \cr '__fzf_ctrl_r'
bind \cx '__fzf_ctrl_x'
bind \ec '__fzf_alt_c'

if bind -M insert > /dev/null 2>&1
  bind -M insert \ct '__fzf_ctrl_t'
  bind -M insert \cr '__fzf_ctrl_r'
  bind -M insert \cx '__fzf_ctrl_x'
  bind -M insert \ec '__fzf_alt_c'
end
