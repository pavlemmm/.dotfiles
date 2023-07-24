from libqtile.bar import Bar
from libqtile.lazy import lazy
from libqtile.widget import (
    GroupBox,
    Spacer,
    TaskList,
    CurrentLayout,
    KeyboardLayout,
    TextBox,
    PulseVolume,
    Systray,
    Clock,
    GenPollText,
    # WindowTabs,
)
from settings import colors
from custom_functions import executeShellCmd, getShellOut


def left_arrow(bg_color, fg_color):
    return TextBox(
        text="\ue0b2", padding=0, fontsize=15, background=bg_color, foreground=fg_color
    )

bar = Bar(
    [
        Spacer(length=10),
        GroupBox(
            this_current_screen_border=colors["primary"],
            disable_drag=True,
            use_mouse_wheel=True,
            highlight_method="line",
            # inactive='#505050',
            borderwidth=2,
        ),
        Spacer(length=10),
        # WindowTabs(),
        TaskList(
            icon_size=0,
            font="JetBrainsMono Nerd Font",
            # foreground = colors[],
            # background = colors["unfocused"],
            borderwidth=8,
            margin=0,
            border="#303030",
            padding=2,
            # window_name_location=True,
            highlight_method="block",
            # urgent_alert_method="border",
            # urgent_border = colors[0],
            rounded=False,
            txt_floating="🗗 ",
            txt_maximized="🗖 ",
            txt_minimized="🗕 ",
        ),
        Spacer(length=10),
        left_arrow("#000000", "#202020"),
        Spacer(length=8, background="#202020"),
        Systray(background="#202020"),
        Spacer(length=8, background="#202020"),
        left_arrow("#202020", "#282828"),
        Spacer(length=8, background="#282828"),
        KeyboardLayout(
            fmt="󰌌  {}",
            configured_keyboards=["us", "rs -variant latin"], background="#282828"
        ),
        Spacer(length=8, background="#282828"),
        left_arrow("#282828", "#303030"),
        Spacer(length=8, background="#303030"),
        CurrentLayout(fmt="󰕰  {}", background="#303030"),
        Spacer(length=8, background="#303030"),
        left_arrow("#303030", "#383838"),
        Spacer(length=8, background="#383838"),
        PulseVolume(background="#383838", mouse_callbacks={"Button1": lazy.spawn("pavucontrol")}, fmt="  {}"),
        Spacer(length=8, background="#383838"),
        left_arrow("#383838", "#404040"),
        Spacer(length=8, background="#404040"),
        Clock(format="%d %m %Y  %b  %a  %I:%M:%S %p", background="#404040"),
        Spacer(length=8, background="#404040"),
        left_arrow("#404040", "#484848"),
        Spacer(length=8, background="#484848"),
        GenPollText(update_interval=1000000, func=lambda: getShellOut('whoami'), background="#484848", mouse_callbacks={"Button1": executeShellCmd("~/.config/rofi/scripts/powermenu.sh")}),
        Spacer(length=8, background="#484848"),
    ],
    # margin=0,
    # background="#000000CC",
    # border_width=0,
    size=21,
    # border_width=[0, 0, 2, 0],  # Draw top and bottom borders
    # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
)
