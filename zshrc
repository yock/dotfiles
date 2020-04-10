eval "$(rbenv init -)"
eval "$(nodenv init -)"

source $INSTALL_DIR/packages/geometry/geometry.zsh
source $INSTALL_DIR/packages/zsh-autosuggestions/zsh-autosuggestions.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

typeset -U path cdpath fpath
setopt auto_cd
cdpath=($HOME/src)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d

export GPG_TTY=$(tty)
