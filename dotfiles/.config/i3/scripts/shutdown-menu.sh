#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Reload I3\n  Log Out" | rofi -dmenu -i)

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Reload I3") i3-msg reload ;;
	"  Log Out") i3-msg exit ;;
	*) exit 1 ;;
esac
