#
# ~/.bash_profile
#
PATH=$HOME/bin:$PATH
export EDITOR=vi
export VISUAL=vi
export PAGER=less
export LESS=-efgiMRX
export VMWARE_USE_SHIPPED_LIBS=yes
export BORG_REPO=/ext/qnap/backup/linux
export TMSU_DB=$HOME/.tmsu/db

stty -ixon

~/bin/ki

[[ -f ~/.bashrc ]] && . ~/.bashrc
