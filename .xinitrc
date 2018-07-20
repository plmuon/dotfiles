exec >$HOME/.xlog 2>&1
xrdb -load ~/.Xresources

d=$(xinput | awk '/M510/ {print substr($5,4)}')
xinput set-button-map $d 1 2 3 4 5 6 7 9 8

xsetroot -solid \#001020

xset +dpms
xset dpms 300 300 300
xset r rate 200 80

numlockx
urxvt -e screen -UDRR &

exec $HOME/.xinit-bspwm
