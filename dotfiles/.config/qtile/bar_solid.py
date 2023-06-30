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
    # WindowTabs,
)
from colorschemes import colors
from libqtile.lazy import lazy
from unicodes import *
import os

bar = Bar(
    [
        Spacer(length=10),
        GroupBox(
            this_current_screen_border=colors["primary"],
            disable_drag=True,
            use_mouse_wheel=True,
            highlight_method="line",
            borderwidth=2,
        ),
        Spacer(length=15),
        # WindowTabs(),
        TaskList(
            icon_size=0,
            font="JetBrainsMono Nerd Font",
            # foreground = colors[],
            # background = colors["unfocused"],
            borderwidth=2,
            margin=0,
            border='#202020',
            padding=4,
            highlight_method="border",
            title_width_method="uniform",
            urgent_alert_method="border",
            # urgent_border = colors[0],
            rounded=True,
            txt_floating="🗗 ",
            txt_maximized="🗖 ",
            txt_minimized="🗕 ",
        ),
        Spacer(length=10),
        left_arrow('#000000', '#202020'),
        Spacer(length=5, background='#202020'),
        Systray(background='#202020'),
        Spacer(length=8, background='#202020'),
        left_arrow('#202020', '#303030'),
        Spacer(length=5, background='#303030'),
        KeyboardLayout(configured_keyboards=["us", "rs -variant latin"], background='#303030'),
        Spacer(length=5, background='#303030'),
        left_arrow('#303030', '#404040'),
        Spacer(length=5, background='#404040'),
        CurrentLayout(fmt="󰕰 {}", background='#404040'),
        Spacer(length=5, background='#404040'),
        left_arrow('#404040', '#505050'),
        Spacer(length=5, background='#505050'),
        TextBox(
            text="",
            mouse_callbacks={"Button1": lazy.spawn("pavucontrol")},
            background='#505050'
        ),
        PulseVolume(background='#505050'),
        Spacer(length=5, background='#505050'),
        left_arrow('#505050', '#5e5e5e'),
        Spacer(length=5, background='#5e5e5e'),
        Clock(format="%d.%m.%Y  %a %I:%M %p", background='#5e5e5e'),
        Spacer(length=5, background='#5e5e5e'),
        left_arrow('#5e5e5e', '#6d6d6d'),
        Spacer(length=2, background="#6d6d6d"),
        TextBox(
            text="󰤄",
            background="#6d6d6d",
            mouse_callbacks={
                "Button1": lazy.spawn(
                    os.path.expanduser("~/.config/qtile/scripts/shutdown-menu.sh")
                )
            },
        ),
        Spacer(length=8, background="#6d6d6d"),
    ],
    margin=0,
    # background="#00000000",
    border_width=0,
    size=24,
    # border_width=[0, 0, 2, 0],  # Draw top and bottom borders
    # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
)
