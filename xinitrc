#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xsetroot -solid black
xrdb -load .Xresources
xrdb -merge .Xresources-stcolor-base16-monokai

#/path/to/pywal-venv/bin/wal -i /path/to/wallpaper.jpg
polybar top_primary &
[ -n "${BSPWM_TWO_MONITORS}" ] && polybar top_external &
compton &
#start-pulseaudio-x11 &
#wal -i /home/rick/walls/273005.jpg  # bladerunner type thang
#wal -R
feh --bg-max /home/rick/walls/273005.jpg  # bladerunner type thang

exec /bin/bspwm
exec /bin/spectrwm
exec /usr/local/bin/bspwm  # built and installed by me

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
