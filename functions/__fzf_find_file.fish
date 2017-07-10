function __fzf_find_file
  set -q FZF_FIND_FILE_COMMAND
  or set -l FZF_FIND_FILE_COMMAND "command find -L \$PWD -mindepth 1 \\( -path \$PWD'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null"
  eval "$FZF_FIND_FILE_COMMAND" | eval "__fzfcmd -m $FZF_DEFAULT_OPTS $FZF_FIND_FILE_OPTS" | while read -l s; set selects $selects $s; end
  for select in $selects
    commandline -it -- "\"$select\""
    commandline -it -- " "
  end
  commandline -f repaint
end
