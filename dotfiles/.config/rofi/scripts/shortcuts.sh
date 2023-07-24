THEME=$HOME/.config/rofi/scripts/themes/shortcuts-theme.rasi

PROJECTS_FOLDER=~/Documents

TERMINAL=alacritty

execute_shell() {
    $TERMINAL -e $SHELL -c "source ~/.zshrc && $1"
}


option_1="1) 󰅩 Open Dev Environment"
option_2="2)  Edit config files"
option_3="3)  Open github.com/pavlemmm"

options=$(printf "$option_1\n$option_2\n$option_3" | rofi -p " Quick Menu" -theme $THEME -dmenu -i)

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
                $TERMINAL --working-directory $PROJECTS_FOLDER/$d &
                # sleep 0.1
                execute_shell "nvim $PROJECTS_FOLDER/$d" &
                exit 1
            fi
        done

        mkdir $PROJECTS_FOLDER/$options
        $TERMINAL --working-directory $PROJECTS_FOLDER/$options &
        # sleep 0.1
        execute_shell "nvim $PROJECTS_FOLDER/$options" &
        ;;
	$option_2) 
        option_1="1)  Open NeoVim config"
        option_2="2)  Open Qtile config"
        option_3="3)  Open i3 config"
        option_4="4)  Open Rofi config"

        options=$(printf "$option_1\n$option_2\n$option_3\n$option_4" | rofi -p " Configs" -theme $THEME -dmenu -i)

        case $options in
            $option_1) execute_shell "nvim ~/.config/nvim/" & ;;
            $option_2) execute_shell "cd ~/.config/qtile/ && nvim config.py" & ;;
            $option_3) execute_shell "cd ~/.config/i3/ && nvim config" & ;;
            $option_4) execute_shell "nvim ~/.config/rofi" & ;;
	        *) ~/.config/rofi/scripts/shortcuts.sh & exit 1 ;;
        esac
        ;;
	$option_3)
        firefox 'https://github.com/pavlemmm/' &
        ;;
	*) exit 1 ;;
esac
