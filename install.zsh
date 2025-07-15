#!/bin/zsh

case `uname` in
  Darwin)
    which brew > /dev/null
    if (( $? != 0 )); then
      echo "First installing Homebrew"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo "Installing dependencies from Homebrew"
    brew install -q $(< ./dependencies/homebrew.txt)
  ;;
  Linux)
    mkdir -p ~/.local/share
    mkdir -p ~/.local/bin

    if [[ ! -a ~/.local/bin/lua-language-server ]]; then
      echo "Installing Lua Language Server"
      pushd ~/.local/share
      mkdir -p lua-language-server
      curl -L -O "https://github.com/LuaLS/lua-language-server/releases/download/3.13.0/lua-language-server-3.13.0-linux-x64.tar.gz"
      tar -xf lua-language-server-3.13.0-linux-x64.tar.gz -av -C ./lua-language-server
      ln -s ~/.local/share/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
      popd
    fi

    if [[ ! -a ~/.local/bin/nvim ]]; then
      echo "Installing Installing Neovim"
      pushd ~/.local/bin
      curl -L -o nvim "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
      chmod u+x nvim
      popd
    fi

    echo "Installing dependencies with Apt"
    sudo apt-add-repository -y universe
    sudo apt-add-repository -y --ppa ppa:zhangsongcui3371/fastfetch
    sudo apt install $(< ./dependencies/apt.txt)
  ;;
esac

echo "Installing rbenv plugins"
pushd ruby/.rbenv/plugins
git -C rbenv-default-gems pull || git clone git@github.com:rbenv/rbenv-default-gems.git rbenv-default-gems
popd

echo "Installing Zsh plugins"
pushd zsh/dot-scripts
git -C geometry pull || git clone git@github.com:geometry-zsh/geometry.git geometry
popd

echo "Installing TMUX plugins"
pushd tmux/.config/tmux/plugins
git -C tpm pull || git clone git@github.com:tmux-plugins/tpm.git tpm
popd

echo "Linking files"
stow --dotfiles -t ~ zsh
stow --dotfiles -t ~ ruby
stow --dotfiles -t ~ nvim
stow --dotfiles -t ~ tmux
stow --dotfiles -t ~ wez
stow --dotfiles -t ~ ghostty
