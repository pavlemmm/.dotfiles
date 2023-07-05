option_1="1)  Capture Desktop"
option_2="2)  Capture Desktop at Clipboard"
option_3="3)  Capture Selection"
option_4="4)  Capture Selection at Clipboard"
option_5="5)  Capture Window"
option_6="6)  Capture Window at Clipboard"

theme="$HOME/.config/rofi/scripts/themes/screenshot-theme.rasi"

options=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi -theme $theme -dmenu -i)

dir="$HOME/Pictures/screenshots/"

if [ ! -d $dir ]; then
  mkdir -p $dir
fi

case $options in
	$option_1) maim --format=png "$dir/ss-$(date +%s)-desktop.png" ;;
	$option_2) maim --format=png | xclip -selection clipboard -t image/png ;;
	$option_3) maim --format=png --select "$dir/ss-$(date +%s)-select.png" ;;
	$option_4) maim --format=png --select | xclip -selection clipboard -t image/png ;;
	$option_5) maim --format=png --window $(xdotool getactivewindow) "$dir/ss-$(date +%s)-window.png" ;;
	$option_6) maim --format=png --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png ;;
	*) exit 1 ;;
esac
