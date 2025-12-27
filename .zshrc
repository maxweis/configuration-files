# oh-my-zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
COMPLETION_WAITING_DOTS="true"
MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='ls .'
plugins=(git aws azure brew colorize command-not-found copyfile docker-compose docker dotenv extract git-auto-fetch gcloud gradle helm kubectl kubectx minikube mvn npm opentofu rust sdk ssh terraform web-search magic-enter)
source $ZSH/oh-my-zsh.sh

# Configurations
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch $(uname -m)"

# Kubernetes Aliases
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

# Misc Aliases
alias dcom="docker-compose"
alias vim="nvim"
alias vi="nvim"
alias tf="terraform"

# Utility functions
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

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000           # How many lines to keep in memory
SAVEHIST=500000           # How many lines to save to disk
setopt SHARE_HISTORY      # Share history between open terminals immediately
setopt APPEND_HISTORY     # Append to history file, don't overwrite
setopt HIST_IGNORE_DUPS   # Don't record an entry if it's the same as the previous one
setopt HIST_IGNORE_SPACE  # Don't record commands starting with a space (good for secrets)
setopt HIST_FIND_NO_DUPS  # Do not display duplicates when searching history

# Navigation
setopt AUTO_CD           # Type 'src' instead of 'cd src'
setopt AUTO_PUSHD        # 'cd' pushes the old directory onto a stack
setopt PUSHD_IGNORE_DUPS # Don't push the same dir twice
setopt PUSHD_MINUS       # Swap usage of +/- for directory stack
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# File Operation Safety
alias cp='cp -iv'   # Confirm before overwriting
alias mv='mv -iv'   # Confirm before overwriting
alias rm='rm -iv'   # Confirm before deleting
