from libqtile.bar import Bar
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
)
from colorschemes import colors
from libqtile.lazy import lazy
from unicodes import *
import os

bar = Bar(
    [
        Spacer(length=15),
        GroupBox(
            this_current_screen_border=colors["primary"],
            highlight_color='#00000033',
            disable_drag=True,
            use_mouse_wheel=True,
            inactive='#808080',
            highlight_method="line",
            borderwidth=2,
        ),
        Spacer(length=15),
        # WindowTabs(),
        TaskList(
            icon_size=0,
            font="JetBrainsMono Nerd Font",
            fontsize=13,
            # foreground = colors[],
            # background = colors["unfocused"],
            borderwidth=0,
            margin=0,
            border='#10101077',
            padding=4,
            highlight_method="block",
            title_width_method="uniform",
            urgent_alert_method="border",
            # urgent_border = colors[0],
            rounded=True,
            txt_floating="🗗 ",
            txt_maximized="🗖 ",
            txt_minimized="🗕 ",
        ),
        Spacer(length=15),
        Systray(),
        Spacer(length=10),
        KeyboardLayout(configured_keyboards=["us", "rs -variant latin"]),
        Spacer(length=10),
        CurrentLayout(fmt="󰕰 {}"),
        Spacer(length=10),
        TextBox(
            text="",
            mouse_callbacks={"Button1": lazy.spawn("pavucontrol")},
        ),
        PulseVolume(),
        Spacer(length=10),
        Clock(format="%d.%m.%Y  %a %I:%M %p"),
        Spacer(length=10),
        TextBox(
            text="󰤄",
            mouse_callbacks={
                "Button1": lazy.spawn(
                    os.path.expanduser("~/.config/qtile/scripts/shutdown-menu.sh")
                )
            },
        ),
        Spacer(length=15),
    ],
    margin=[4,0,4,0],
    background="#00000000",
    border_width=0,
    size=24,
    # border_width=[0, 0, 2, 0],  # Draw top and bottom borders
    # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
)
