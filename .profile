#
# ~/.bash_profile
#
PATH=$HOME/bin:$HOME/.local/bin:$PATH

export _JAVA_AWT_WM_NONREPARENTING=1
export BORG_REPO=borg@sol.home:linux
export GTK_THEME=Adwaita:dark
# export MOZ_ALLOW_GTK_DARK_THEME=true
export EDITOR=vi
export VISUAL=vi
export PAGER=less
export LESS=-efgiMRX
export PGHOST=sol
export WORKON_HOME=~/src/venv


[[ -x ~/bin/ki ]] && ~/bin/ki &

[[ -f ~/.bashrc ]] && . ~/.bashrc
