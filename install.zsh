#!/bin/zsh

function zsh_check_installed() {
    ls . | grep $1 > /dev/null
    result=$?
    return $result
}

function brew_check_installed() {
    brew info $1 | grep "Not installed" > /dev/null
    result=$?
    ((result ^= 1))
    return $result
}

INSTALL_DIR=$HOME/.files

mkdir -p packages
pushd packages

# Install ZSH packages
which git > /dev/null
if (( $? == 0 )); then
    while IFS= read -r line; do
        directory=${${line%.git}#*/}
        zsh_check_installed $directory

        if [[ $? != 0 ]]; then
            echo "Cloning $line into packages..."
            git clone -q $line
        else
            echo "$directory already installed"
        fi
    done < ../dependencies/zsh.txt
else
    echo "Install git before continuing"
    exit 1
fi

which brew > /dev/null
if (( $? == 0 )); then
    # Install Homebrew packages
    while IFS= read -r line; do
        brew_check_installed $line
        if [[ $? != 0 ]]; then
            echo "Installing $line with Homebrew"
            brew install $line
        else
            echo "$line already installed"
        fi
    done < ../dependencies/homebrew.txt
else
    echo "Install homebrew before continuing"
    exit 1
fi

popd

mkdir -p $INSTALL_DIR
cp -rf packages $INSTALL_DIR/packages
cp -f zshrc $INSTALL_DIR/zshrc

# Insert the INSTALL_DIR variable into the installed run control file
sed -i "" -e "1 i\\
INSTALL_DIR=$INSTALL_DIR\\
" $INSTALL_DIR/zshrc

ln -sf $INSTALL_DIR/zshrc ~/.zshrc
