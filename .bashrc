#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vi
export VISUAL=vi
export PAGER=less
export LESS=-efgiMRX
# export VMWARE_USE_SHIPPED_LIBS=yes

stty -ixon

sn=/data/x/s/norm

# PS1='[\u@\h \W]\$ '
# PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\w\$ '
PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\W\$ '

function rmext {
  echo "$1" | sed 's/\.[^.]*$//'
}

function hb5 {
  f=$(rmext "$1")
  HandBrakeCLI --main-feature --preset-import-gui  --preset 'plm h265' -i "$1" -o "$f".mp4
}

function hb5d {
  f=$(rmext "$1")
  HandBrakeCLI --main-feature --preset-import-gui  --preset 'plm h265 dfast' -i "$1" -o "$f".mp4
}

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
