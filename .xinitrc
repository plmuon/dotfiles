exec >$HOME/.xlog-stdout
exec 2>$HOME/.xlog-stderr
xrdb -load ~/.Xresources

d=$(xinput | awk '/M510/ {print substr($5,4)}')
xinput set-button-map $d 1 2 3 4 5 6 7 9 8

xsetroot -solid \#003040

xset +dpms
xset dpms 300 300 300
xset r rate 200 60
xautolock -time 15 -locker slock &

numlockx

polybar -r orion &
urxvt &

exec cwm

#exec i3
#exec $HOME/.xinit-bspwm
#dwmstatus &
#exec dwm
