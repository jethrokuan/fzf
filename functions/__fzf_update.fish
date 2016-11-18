function __fzf_update
  set -l vers (fzf --version)
  echo "Uninstalling fzf v$vers"
  rm -rf "$HOME/.fzf"
  __fzf_install
end
