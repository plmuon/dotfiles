#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon

git_branch() {
     git branch 2> /dev/null | sed -n '/^*/s/^..//p'
}

PS1="\[\e]0;\w \$(git_branch)\a\]\w\$ "

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

findex() {
	find -name \*.$1 -type f -print0 | xargs -0 grep -i "$2"
}

find0() {
	find -type f -print0 | xargs -0 grep -i "$1"
}

menv() {
    if [[ -z $1 ]]; then return; fi
    if [[ -d $WORKON_HOME/$1 ]]; then rm -rf $WORKON_HOME/$1; fi
    bazel run $1_devenv | bash -s $WORKON_HOME/$1
    venv $1
    pip install black rope jedi
}

venv() {
    if [[ -z $1 ]]; then return; fi
    . $WORKON_HOME/$1/bin/activate
}

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
