# export PS1="\w <U+1F354>  "
export PS1="\[\033[01;35m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ "
export MYSQL_PS1="mysql (\h) [\d]> "
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# history
export HISTCONTROL=erasedups
export HISTSIZE=1000
shopt -s histappend

#git
alias gitdiff='git difftool -t opendiff -y'

alias ls='ls -G'
export PATH=~/.npm-global/bin:/usr/local/bin:/usr/bin:/usr/local/mysql/bin:$PATH


# once 
# pieter:~$ defaults write com.apple.dock no-bouncing -bool TRUE
# pieter:~$ killall Dock
#
