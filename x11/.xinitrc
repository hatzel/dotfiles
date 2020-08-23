xrandr --dpi 80
exec i3
xset r rate 180 30
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi
