THEME="$HOME/.config/rofi/scripts/themes/globallauncher-theme.rasi"

option_1="1) 󱓞 Launcher"
option_2="2) 󰀻 App Launcher"
option_3="3)  Shortcuts"
option_4="4)  Window Picker"
option_5="5) 󰹑 Screenshot"
option_6="6)  Power Menu"

options=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi -theme $THEME -dmenu -i)

case $options in
	$option_1) ~/.config/rofi/scripts/launcher.sh ;;
	$option_2) ~/.config/rofi/scripts/allapps.sh.sh ;;
	$option_3) ~/.config/rofi/scripts/shortcuts.sh ;;
	$option_4) ~/.config/rofi/scripts/window.sh ;;
	$option_5) ~/.config/rofi/scripts/screenshot.sh ;;
	$option_6) ~/.config/rofi/scripts/powermenu.sh ;;
	*) exit 1 ;;
esac
