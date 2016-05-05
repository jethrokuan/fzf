function __fzf_install
    printf "Installing fzf...\n"
    git clone --quiet --depth 1 https://github.com/junegunn/fzf.git ~/.fzf & await
    pushd ~/.fzf
    sed -i "s|-fL|-fLs|g" install
    printf "n\nn\nn\n" | ./install ^ /dev/null > /dev/null & await
    popd
    commandline -f repaint
end
