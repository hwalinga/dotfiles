setxkbmap -option compose:menu

/home/hielke/repos/ksuperkey/ksuperkey

xmodmap /home/hielke/.Xmodmap

xcape -e 'Control_L=Escape'

sleep 3
killall conky
conky -c /home/hielke/.conky/MX-KoO/MX-Full &
conky -c /home/hielke/.conky/MX-Emays/MX-emays &
