function __fzf_install
    if not type -q "fzf"
      get --prompt "Where would you like to install it? (default \"$HOME/.fzf\")\n->" --default "$HOME/.fzf" -r '\([^\0 !$`&*()+]\|\\\(\ |\!|\$|\`|\&|\*|\(|\)|\+\)\)\+' | read -l install_dir
      set -U FZF_DIR $install_dir
    else
        echo "fzf already installed."
        return 1
    end

    echo "Installing fzf... this may take a while."

    set -l archi (uname -sm)
    set -l github_api_endpoint "https://api.github.com/repos/junegunn/fzf-bin/releases/latest"
    set -l vers (curl -s $github_api_endpoint | sed -n 's/[[:space:]]*"tag_name": "\([0-9.]*\)",/\1/p')

    if test -d $FZF_DIR
        echo "$FZF_DIR is a directory, fzf might already be installed. Removing folder and trying again..."
        rm -rf $FZF_DIR
        __fzf_install
    else
        set -l pkg
        switch $archi
            case Linux\ x86_64
                set pkg "fzf-$vers-linux_amd64"
            case Darwin\ x86_64
                set pkg "fzf-$vers-darwin_amd64"
            case Linux\ i\*86
                set pkg "fzf-$vers-linux_386"
            case Darwin\ i\*86
                set pkg "fzf-$vers-darwin_386"
            case *
                printf "Your system is does not support prebuilt binaries.\n"
                return 0
        end

        set -l url "https://github.com/junegunn/fzf-bin/releases/download/$vers/$pkg.tgz"

        git clone --quiet --depth 1 "https://github.com/junegunn/fzf.git" $FZF_DIR

        pushd "$FZF_DIR/bin"

        if type -q curl
            curl -sfL "$url" | tar -xz
        else if type -q wget
            wget -O - "$url" | tar -xz
        end

        mv $pkg "fzf"
        chmod +x fzf

        set -l in_user_paths false
        for x in $fish_user_paths
            if test "$x" = "$FZF_DIR/bin"
                set in_user_paths true
                break
            end
        end

        if test "$in_user_paths" = "false"
            set -U fish_user_paths $fish_user_paths "$FZF_DIR/bin"
        end

        popd

        if type -q fzf
            printf "Successfully installed fzf v$vers\n"
            return 1
        else
            return 0
        end
    end
end
