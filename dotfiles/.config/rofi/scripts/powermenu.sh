THEME="$HOME/.config/rofi/scripts/themes/powermenu-theme.rasi"

option_1='1)  Shutdown'
option_2='2)  Reboot'
option_3='3)  Suspend'
option_4='4)  Logout'

uptime=`uptime -p | sed -e 's/up //g'`

options=$(printf "$option_1\n$option_2\n$option_3\n$option_4" | rofi -dmenu -theme $THEME -i -mesg "Uptime: $uptime" )

case $options in
	$option_1) systemctl poweroff ;;
	$option_2) systemctl reboot ;;
	$option_3) systemctl suspend ;;
	$option_4)
        if [[ "$DESKTOP_SESSION" == 'i3' ]]; then
            i3-msg exit
        elif [[ "$DESKTOP_SESSION" == 'qtile' ]]; then
            qtile cmd-obj -o cmd -f shutdown
        fi
        ;;
	*) exit 1 ;;
esac
