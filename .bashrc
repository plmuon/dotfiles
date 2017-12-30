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

# PS1='[\u@\h \W]\$ '
# PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\w\$ '
PS1='\[\e]0;\u@\h: \w\a\]\u@\h:\W\$ '

alias ls='ls --color=auto'
alias l='ls -lhL'
alias la='ls -A'
alias ll='ls -lh'

alias ss='sudo systemctl'

alias more=less
alias m=less
alias s='sudo -E'
alias root='sudo -i'
alias pe='ps auxw'
alias rs='rsync -aHSPv --del'
alias sc='screen -DRR'

alias md='cat /proc/mdstat'
alias mdpause='sudo sh -c "echo 1 > /sys/block/md0/md/sync_speed_max"'
alias mdresume='sudo sh -c "echo 200000 > /sys/block/md0/md/sync_speed_max"'

alias g=git
alias p=pushd
alias q=popd

alias cdqt='cd /ext/qnap/data/bt/complete'
sn=/data/x/s/norm
alias cdsn="cd $sn"
alias ff='ftq -f'
alias fe='ftq -e -f'

alias y=yaourt
alias ys='yaourt -S'
alias yu='y -Suya'
alias yf='y -Ss'
alias yr='y -Rsn'
alias yq='y -Q'

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

