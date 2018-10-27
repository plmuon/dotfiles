#
# ~/.bash_profile
#
PATH=$HOME/bin:$HOME/.local/bin:$PATH

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_THEME=Adwaita:dark
export EDITOR=vi
export VISUAL=vi
export PAGER=less
export LESS=-cefgiMRX
export WORKON_HOME=~/venv
export LD_LIBRARY_PATH=/usr/local/lib

[[ -f ~/.bashrc ]] && . ~/.bashrc
