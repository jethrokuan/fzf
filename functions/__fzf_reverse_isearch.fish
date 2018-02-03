function __fzf_reverse_isearch
    history -z | eval (__fzfcmd) --read0 -q '(commandline)' | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end
