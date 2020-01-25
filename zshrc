eval "$(rbenv init -)"
eval "$(nodenv init -)"

source $INSTALL_DIR/packages/geometry/geometry.zsh

setopt auto_cd
cdpath=($HOME/Projects)
