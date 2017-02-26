function __fzf_find_file
  set -q FZF_FIND_FILE_COMMAND
  or set -l FZF_FIND_FILE_COMMAND "
  command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
  -o -type f -print \
  -o -type d -print \
  -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  fish -c "$FZF_FIND_FILE_COMMAND" | __fzfcmd -m $FZF_FIND_FILE_OPTS | while read -l s; set selects $selects $s; end
  if not test "$dir" = "."
    commandline -t ""
  end
  for select in $selects
    commandline -it -- "\"$select\""
    commandline -it -- " "
  end
  commandline -f repaint
end
