#!/bin/zsh

which brew > /dev/null
if (( $? != 0 )); then
    echo "First installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing dependencies from Homebrew"
brew install -q $(< ./dependencies/homebrew.txt)

echo "Installing Neovim HEAD"
brew install -q neovim --HEAD

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
