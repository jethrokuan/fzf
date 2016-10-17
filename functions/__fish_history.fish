function __fish_history
  if test -e ~/.config/fish/fish_history
    tac ~/.config/fish/fish_history | grep "^\- cmd: " | sed 's/\- cmd: //' 
  else if test -e ~/.local/share/fish/fish_history
    tac ~/.local/share/fish/fish_history | grep "^\- cmd: " | sed 's/\- cmd: //'
  else
    history
  end
end
