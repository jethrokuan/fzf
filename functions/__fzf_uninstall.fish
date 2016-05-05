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
end
