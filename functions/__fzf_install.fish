function __fzf_install
    set -l archi (uname -sm)
    set -l vers "0.13.3"

    if test -d "$HOME/.fzf"
      echo "$HOME/.fzf is a directory, fzf might already be installed. Removing folder and trying again..."
      rm -rf "$HOME/.fzf"
      __fzf_install
    end

    set -l pkg
    switch $archi
      case Linux\ x86_64
        set pkg "fzf-$vers-linux_amd64"
      case Darwin\ x86_64
        set pkg "fzf-$vers-darwin_amd64"
      case Linux\ i*86
        set pkg "fzf-$vers-linux_386"
      case Darwin\  i*86
        set pkg "fzf-$vers-darwin_386"
      case *
        printf "Your system is does not support prebuilt binaries.\n"
        return 0
    end

    set -l url "https://github.com/junegunn/fzf-bin/releases/download/$vers/$pkg.tgz"

    git clone --quiet --depth 1 "https://github.com/junegunn/fzf.git" "$HOME/.fzf"

    pushd "$HOME/.fzf/bin"

    if type -q curl
      curl -sfL "$url" | tar -xz
    else if type -q wget
      wget -O - "$url" | tar -xz
    end

    mv $pkg "fzf"
    chmod +x fzf

    set -l in_user_paths false
    for x in $fish_user_paths
      if test "$x" = "$HOME/.fzf/bin"
        set in_user_paths true
        break
      end
    end

    if test "$in_user_paths" = "false"
      set -U fish_user_paths $fish_user_paths "$HOME/.fzf/bin"
    end

    popd

    if type -q fzf
      printf "Successfully Installed\n"
      return 1
    else
      return 0
    end
end
