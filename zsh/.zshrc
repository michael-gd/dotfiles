export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git z direnv)

source $ZSH/oh-my-zsh.sh

# User configuration

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias python='python3'

export AWS_PROFILE=dev
eval "$(pyenv init -)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ccroot() {
  local root
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Not inside a git repository"
    return 1
  }

  cd "$root" && claude "$@"
}

gsa() { git rebase -i --autosquash "$(git merge-base "${1:-main}" HEAD)"; }
