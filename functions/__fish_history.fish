function __fish_history
  if test -e ~/.config/fish/fish_history
    cat ~/.config/fish/fish_history | grep "^\- cmd: " | sed 's/\- cmd: //' 
  else if test -e ~/.local/share/fish/fish_history
    cat ~/.local/share/fish/fish_history | grep "^\- cmd: " | sed 's/\- cmd: //'
  else
    history
  end
end
