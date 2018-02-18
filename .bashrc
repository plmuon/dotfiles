#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon

# PS1='[\u@\h \W]\$ '
# PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\w\$ '
PS1='\[\e]0;\u@\h: \w\a\]\h:\w\$ '
if [ ! -z ${VIFM+x} ]; then 
    PS1="vifm:$PS1"
fi


function rmext {
  echo "$1" | sed 's/\.[^.]*$//'
}

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

if [ -f ~/.bookmarks ]; then
	. ~/.bookmarks
fi
