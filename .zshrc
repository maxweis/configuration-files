# The following lines were added by compinstall
PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/max/executables
export EDITOR=vim
specy
cowsay -f /dev/null < ~/.note

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/max/.zshrc'

autoload -Uz compinit
autoload -U promptinit
promptinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt extendedglob
bindkey -e
prompt suse
alias x="./exec"
alias rx="rustc main.rs -o exec"
alias rmdep="sudo pacman -Rccssnd"
alias webh="w3m www.google.com"
alias xoff="xset -dpms s off"
alias omake="sudo make -j9"
alias waur="w3m https://aur.archlinux.org"
alias max="make && ./exec"
alias smd="ssh max@192.168.1.101 -C  -X"
alias shd="ssh hannah@192.168.1.104 -C blowfish-cbc -X"
alias sfmd="sftp max@192.168.1.101 -C blowfish-cbc -X"
alias sfhd="sftp hannah@192.168.1.104 -C blowfish-cbc -X"
alias hvnc="vncviewer 192.168.1.104 -passwd /home/max/.vnc/passwd"
alias mvnc="vncviewer 192.168.1.101 -passwd /home/max/.vnc/passwd"
alias tap="ssh -C root@192.168.1.104 'primes 0'"
export LC_ALL="en_US.UTF-8"
alias n64="mupen64plus --resolution=1920x1080"
alias pe="./.projectfile"

typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
magic-enter () {
  if [[ -z $BUFFER ]]; then
    echo ""
    if [[ -d .git ]]; then
      git status
    else
      ls -CF
    fi
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N magic-enter
bindkey "^M" magic-enter
