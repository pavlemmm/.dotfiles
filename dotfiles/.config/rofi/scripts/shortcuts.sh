option_1="1)  Open NeoVim config"
option_2="2)  Open Qtile config"
option_3="3)  Open i3 config"

theme="$HOME/.config/rofi/scripts/themes/shortcuts-theme.rasi"

options=$(printf "$option_1\n$option_2\n$option_3" | rofi -theme $theme -dmenu -i)

terminal='alacritty'

case $options in
	$option_1) $terminal -e $SHELL -c "cd ~/.config/nvim/ && nvim" ;;
	$option_2) $terminal -e $SHELL -c "cd ~/.config/qtile/ && nvim" ;;
	$option_3) $terminal -e $SHELL -c "cd ~/.config/i3/ && nvim" ;;
	*) exit 1 ;;
esac
