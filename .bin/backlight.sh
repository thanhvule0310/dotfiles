
#!/bin/bash

function send_notification() {
	brightness=$(light | grep "" | cut -d '.' -f 1)
	icon_name="/usr/share/icons/Faba/48x48/notifications/notification-display-brightness.svg"

	# Send the notification
	dunstify "$brightness""     " -i "$icon_name" -r 556 -t 2000
}

case $1 in
up)
	light -A 10
	send_notification
	;;
down)
	if [ $(light | grep "" | cut -d '.' -f 1) -gt "10" ]; then
		light -U 10
		send_notification
	else
		send_notification
	fi
	;;
esac
