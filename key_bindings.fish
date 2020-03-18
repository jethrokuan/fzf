if not functions -q fzf_key_bindings
  source $OMF_PATH/pkg/fzf/conf.d/fzf_key_bindings.fish
else
  fzf_key_bindings
end
