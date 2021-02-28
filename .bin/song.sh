#!/bin/zsh

function scroll () {
	prefix="$1"
	scrolling="$2"
	temp="$(echo "$scrolling"| sed "s/^\(.\{20\}\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$//")"
	suffix="$3"
	if [ "$(echo -n $scrolling |wc -c)" -gt 20 ]; then
		echo "$prefix%{T7}$temp%{T-}$suffix"
		sleep 0.5

		zscroll -l 20 \
        		--delay 0.2 \
			--before-text "$prefix%{T7}" \
			--after-text "%{T-}$suffix" \
			--scroll-padding "     " \
			--update-check true "echo '$(get_title)'" &

		wait
	else
		echo "$prefix%{T8} $temp %{T-}$suffix"
	fi
} #

function get_artist () {
	echo "$(playerctl metadata --format " {{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")"
} #

function get_title () {
	echo ${"$(playerctl metadata --format "{{title}}")":0:50}
} #

[ ! -z "$(playerctl status 2>/dev/null)" ] \
	&& artist=$(get_artist) \
	&& title=$(get_title) \
	&& ([ -z "$artist$title" ] && scroll "" "NO PLAYER FOUND" "" || scroll " $title" "%{F-}") \
	|| exit 1
