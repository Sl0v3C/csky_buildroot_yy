#!/bin/sh

if [ -f /usr/bin/matchbox-window-manager ]; then
	echo "starting matchbox-window-manger: "
	/usr/bin/matchbox-window-manager &
	echo "Done!"
        sleep 10
	#clear > /dev/tty0
fi

if [ -f /usr/bin/xrdb ]; then
	echo "xrdb .Xresources"
	/usr/bin/xrdb /home/csky/.Xresources
	echo "Done!"
fi

if [ -f /usr/bin/xterm ]; then
	echo "starting xterm: "
	/usr/bin/xterm &
	echo "Done!"
	#clear > /dev/tty0
fi
