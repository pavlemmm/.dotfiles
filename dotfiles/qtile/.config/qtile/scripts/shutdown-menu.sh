#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Reset Qtile\n  Log Out" | rofi -dmenu -i)

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Reset Qtile") qtile cmd-obj -o cmd -f reload_config ;;
	"  Log Out") qtile cmd-obj -o cmd -f shutdown ;;
	*) exit 1 ;;
esac
