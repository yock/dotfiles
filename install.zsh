#!/bin/zsh

function git_check_installed() {
    ls . | grep $1 > /dev/null
    result=$?
    return $result
}

INSTALL_DIR=$HOME/.files

which brew > /dev/null
if (( $? == 0 )); then
    brew install -q $(< ./dependencies/homebrew.txt)
else
    echo "Install homebrew before continuing"
    exit 1
fi

mkdir -p packages
pushd packages

while IFS= read -r line; do
    directory=${${line%.git}#*/}
    git_check_installed $directory

    if [[ $? != 0 ]]; then
        echo "Cloning $line into packages..."
        git clone -q $line
    else
        echo "$directory already installed"
    fi
done < ../dependencies/git.txt

popd

# Post-install
touch ./env
mkdir -p $INSTALL_DIR
cp -rf packages $INSTALL_DIR/
cp -f zshrc $INSTALL_DIR/zshrc
cp -rf functions $INSTALL_DIR/functions
cp -f env $INSTALL_DIR/.env
cp -f pryrc $INSTALL_DIR/.pryrc
mkdir -p $(rbenv root)/plugins
ln -sf $INSTALL_DIR/packages/rbenv-default-gems $(rbenv root)/plugins/rbenv-default-gems
ln -sf $INSTALL_DIR/dependencies/gems.txt $(rbenv root)/default-gems

# Insert the INSTALL_DIR variable into the installed run control file
sed -i "" -e "1 i\\
INSTALL_DIR=$INSTALL_DIR\\
" $INSTALL_DIR/zshrc

ln -sf $INSTALL_DIR/zshrc ~/.zshrc
ln -sf $INSTALL_DIR/.pryrc ~/.pryrc
