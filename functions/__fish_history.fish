function __fish_history
  set -l QUERY_CMD
  if type -q tac
    set QUERY_CMD "tac"
  else
    set QUERY_CMD "tail -r"
  end
  
  if test -e ~/.config/fish/fish_history
    eval $QUERY_CMD ~/.config/fish/fish_history | grep "^\- cmd: " | sed 's/\- cmd: //' 
  else if test -e ~/.local/share/fish/fish_history
    eval $QUERY_CMD ~/.local/share/fish/fish_history | grep "^\- cmd: " | sed 's/\- cmd: //'
  else
    history
  end
end
