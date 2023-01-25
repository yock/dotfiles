eval "$(rbenv init -)"
eval "$(nodenv init -)"

while IFS= read -r line; do
  export $line
done <$INSTALL_DIR/.env

source $INSTALL_DIR/packages/geometry/geometry.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

for file in $INSTALL_DIR/functions/*.zsh; do
  source $file
done

typeset -U path cdpath fpath
setopt auto_cd
cdpath=($HOME/src)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d

export COMPLETION_WAITING_DOTS="true"
export TERM="xterm-256color"
export GPG_TTY=$(tty)
export EDITOR="code -nw"

export PATH="/usr/local/sbin:$PATH"
