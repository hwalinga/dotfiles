# Compose key is the menu key
# setxkbmap -option compose:menu
setxkbmap -option compose:rctrl
# dead_greek key is the right alt
xmodmap -e 'keycode 108 = dead_greek Meta_R Alt_R Meta_R'

# Remap superkey to alt+f1, and do some xcape like magic that superkey
# can still be used as a modifier.
/home/hielke/repos/ksuperkey/ksuperkey

# Other keyboard remaps.
xmodmap /home/hielke/.Xmodmap

# xcape to make left control (now also capslock by .Xmodmap) also act
# like escape when pressed without any otherer key.
xcape -e 'Control_L=Escape'

# Start conky
sleep 3
killall conky
conky -c /home/hielke/.conky/MX-KoO/MX-Full &
conky -c /home/hielke/.conky/MX-Emays/MX-emays &
