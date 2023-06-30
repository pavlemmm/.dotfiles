install_packages () {

    if [[ ! -f /usr/bin/pacman && ! -f /usr/bin/apt  ]]; then
        echo -e "\nPacket manager not supported\n"
        return
    fi

    echo -e "\nWhat display server are you using?\n"

    packages_to_install="base-devel neovim zsh lsd tree stow zsh amd-ucode"

    select c in Xorg Wayland None; do
        case $c in
            Xorg)
                packages_to_install+=" redshift xf86-video-amdgpu mesa"

                echo -e "\nWhat WM/DE are you using?\n"
                select d in Qtile i3 None; do
                    case $d in
                        Qtile)
                            packages_to_install+=" qtile"
                            break
                            ;;
                        i3)
                            packages_to_install+=" i3"
                            break
                            ;;
                        None)
                            break
                            ;;
                        *) echo "Invalid option $REPLY";;
                    esac
                done

                break
                ;;
            Wayland)
                packages_to_install+=" gammastep libva-mesa-driver mesa"

                echo -e "\nWhat WM/DE are you using?\n"
                select d in Sway None; do
                    case $d in
                        Sway)
                            packages_to_install+=" sway swayidle swaylock swayimg swaybg waybar wofi alacritty gammastep libva-mesa-driver mesa"
                            break
                            ;;
                        None)
                            break
                            ;;
                        *) echo "Invalid option $REPLY";;
                    esac
                done

                break
                ;;
            None)
                break
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done


    if [ -f /usr/bin/pacman ]; then
            # ARCH BASED
            echo -e "\nInstalling packages with pacman...\n"
            sudo pacman -Syu
            sudo pacman -S --needed $packages_to_install
    else
        # DEBIAN BASED
        echo -e "\nInstalling packages with apt...\n"
        sudo apt update && sudo apt upgrade
        sudo apt install $packages_to_install

    fi

}
