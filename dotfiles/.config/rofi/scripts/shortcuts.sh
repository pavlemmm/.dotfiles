THEME=$HOME/.config/rofi/scripts/themes/shortcuts-theme.rasi

PROJECTS_FOLDER=~/Documents
TERMINAL=alacritty
TERMINAL_EXEC_CMD="$TERMINAL -e $SHELL -c "


option_1="1)  Open Dev Environment"
option_2="2)  Edit config files"
option_3="3)  Open github.com/pavlemmm"

options=$(printf "$option_1\n$option_2\n$option_3" | rofi -p " Links" -theme $THEME -dmenu -i)

case $options in
    $option_1)
        dirs=$(cd $PROJECTS_FOLDER && ls -d */)
        options=$(printf ' %s\n' $dirs | rofi -p " Open/Create" -theme $THEME -dmenu -i)

        if [[ $options == "" ]]; then
            ~/.config/rofi/scripts/shortcuts.sh &
            exit 1
        fi

        for d in $dirs; do
            if [[ $options == " $d" ]]; then
                $TERMINAL_EXEC_CMD "nvim ~/Documents/$d" &
                $TERMINAL --working-directory ~/Documents/$d &
                exit 1
            fi
        done

        mkdir $PROJECTS_FOLDER/$options
        $TERMINAL_EXEC_CMD "nvim $PROJECTS_FOLDER/$options" &
        $TERMINAL --working-directory ~/Documents/$options &
        ;;
	$option_2) 
        option_1="1)  Open NeoVim config"
        option_2="2)  Open Qtile config"
        option_3="3)  Open i3 config"

        options=$(printf "$option_1\n$option_2\n$option_3" | rofi -p " Configs" -theme $THEME -dmenu -i)

        case $options in
            $option_1) $TERMINAL_EXEC_CMD "nvim ~/.config/nvim/" & ;;
            $option_2) $TERMINAL_EXEC_CMD "nvim ~/.config/qtile/config.py" & ;;
            $option_3) $TERMINAL_EXEC_CMD "nvim ~/.config/i3/config" & ;;
	        *) ~/.config/rofi/scripts/shortcuts.sh & exit 1 ;;
        esac
        ;;
	$option_3)
        firefox 'https://github.com/pavlemmm/' &
        ;;
	*) exit 1 ;;
esac
