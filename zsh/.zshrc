export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:plugins:nvm' lazy yes
plugins=(git z direnv nvm)

source $ZSH/oh-my-zsh.sh

eval "$(pyenv init -)"

ccroot() {
  local root
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Not inside a git repository"
    return 1
  }

  cd "$root" && claude "$@"
}
