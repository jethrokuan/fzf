if not functions -q fzf_key_bindings
  source $OMF_PATH/pkg/fzf/conf.d/fzf_key_bindings.fish
else
  if functions -D fzf_key_bindings | string match -r ".+vendor_functions\.d.+" -q 
    functions -c fzf_key_bindings fzf_key_bindings_vendor
    function fzf_key_bindings
      source $OMF_PATH/pkg/fzf/conf.d/fzf_key_bindings.fish
    end
    fzf_key_bindings
  end
end
