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

# PS1='[\u@\h \W]\$ '
# PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\w\$ '
PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\W\$ '

function rmext {
  echo "$1" | sed 's/\.[^.]*$//'
}

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

if [ -f ~/.bookmarks ]; then
	. ~/.bookmarks
fi
