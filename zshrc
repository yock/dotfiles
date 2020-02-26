eval "$(rbenv init -)"
eval "$(nodenv init -)"

source $INSTALL_DIR/packages/geometry/geometry.zsh
source $INSTALL_DIR/packages/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt auto_cd
cdpath=($HOME/src)
