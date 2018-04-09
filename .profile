#
# ~/.bash_profile
#
PATH=$HOME/bin:$PATH
export BORG_REPO=/ext/qnap/backup/linux
export GTK_THEME=Adwaita:dark
export MOZ_ALLOW_GTK_DARK_THEME=true
export EDITOR=vi
export VISUAL=vi
export PAGER=less
export LESS=-efgiMRX
export PGHOST=sol
export WORKON_HOME=~/src/venv


~/bin/ki

[[ -f ~/.bashrc ]] && . ~/.bashrc
