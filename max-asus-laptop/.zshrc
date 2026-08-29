
# oh-my-zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13
COMPLETION_WAITING_DOTS="true"
MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='ls .'
plugins=(git aws azure brew colorize command-not-found copyfile docker-compose docker dotenv extract git-auto-fetch gcloud gradle helm kubectl kubectx minikube mvn npm opentofu rust sdk ssh terraform web-search magic-enter)
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch $(uname -m)"

alias kc="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias kcgp="kubectl get pods"
alias mk="minikube"
alias kcg="kubectl get"
alias kcd="kubectl describe"
alias kcl="kubectl logs"
alias kce="kubectl edit"
alias kca="kubectl apply"
alias kcdel="kubectl delete"
alias kcex="kubectl explain"

alias dcom="docker-compose"
alias vim="nvim"
alias vi="nvim"
alias tf="terraform"

function w() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: w <interval> <command>"
    return 1
  fi
  local interval=$1
  shift
  local cmd="$*"
  watch -n "$interval" zsh -i -c "source ~/.zshrc; source ~/.zprofile; eval \"$cmd\""
}

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
