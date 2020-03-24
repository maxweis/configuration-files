# The following lines were added by compinstall
~/.profile
PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/max/executables:/home/max/git/Ndless/ndless-sdk/toolchain/install/bin:/home/max/git/Ndless/ndless-sdk/bin:~/.gem/ruby/2.5.0/bin:~/.cargo/bin
export EDITOR=vim
export VISUAL=vim
export GOPATH=~/Code/go
export WINEARCH=win32
export _JAVA_AWT_WM_NONREPARENTING=1
export TERM=xterm-256color
#specy
if [ -s ~/.note ]
then
cowsay -f /dev/null < ~/.note
fi
wmname LG3D

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/max/.zshrc'

autoload -Uz compinit
autoload -U promptinit
promptinit
compinit
kitty + complete setup zsh | source /dev/stdin
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
export LC_ALL="en_US.UTF-8"
setopt appendhistory autocd
unsetopt extendedglob
bindkey -e
prompt suse
alias x="./exec"
alias rx="rustc main.rs -o exec"
alias rmdep="sudo pacman -Rccssnd"
alias xoff="xset -dpms s off"
alias omake="sudo make -j9"
alias max="make && ./exec"
alias n64="mupen64plus --resolution=1920x1080"
alias pe="./.projectfile"
alias hack="ping"
alias wstop="sudo systemctl stop netctl-auto@wlp4s0.service"
alias wstart="sudo systemctl start netctl-auto@wlp4s0.service"
alias wrel="wstop && wstart"
alias nmon="rm /tmp/monitor_lock && bash /home/max/.new_monitor"
alias emacs="emacs -nw"
alias wemacs="emacs"
alias make="make -j7"
alias vs="vim -S"
alias ews="ssh mweis4@linux.ews.illinois.edu"
alias fews="sftp mweis4@linux.ews.illinois.edu"
alias scsh="ssh mweis4@cs423.maxweis.me -XY"
alias mys="ssh max@maxweis.me"
alias inet="sudo openconnect vpn.cites.illinois.edu < ~/.inet_login"
alias beep="play -q -n synth 0.1 sin 880 || echo -e \"\\a\""
alias pic="kitty icat"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/max/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/max/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/max/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/max/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
