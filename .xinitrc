exec >$HOME/.xlog 2>&1
xrdb -load ~/.Xresources

d=$(xinput | awk '/M510/ {print substr($5,4)}')
xinput set-button-map $d 1 2 3 4 5 6 7 9 8

xset +dpms
xset dpms 300 300 300

numlockx
urxvt &

exec $HOME/.xinit-bspwm
