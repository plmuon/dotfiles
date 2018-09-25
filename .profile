#
# ~/.bash_profile
#
PATH=$HOME/bin:$HOME/.local/bin:$PATH

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_THEME=Adwaita:dark
export EDITOR=vi
export VISUAL=vi
export PAGER=less
export LESS=-efgiMRX
export WORKON_HOME=~/venv

[[ -f ~/.bashrc ]] && . ~/.bashrc
