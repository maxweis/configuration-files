
eval "$(/opt/homebrew/bin/brew shellenv)"
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
