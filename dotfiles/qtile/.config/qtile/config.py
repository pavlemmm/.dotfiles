from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal
from libqtile import hook
import os


mod = "mod4"
# terminal = guess_terminal()
terminal = "alacritty"

colors = {
    "primary": "#c74c00",
}

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "f", lazy.window.toggle_floating()),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod],
        "space",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "i", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout"),
    Key([mod], "a", lazy.spawn("rofi -show drun"), desc="Launch rofi"),
    Key([mod, "shift"], "a", lazy.spawn("rofi -show run"), desc="Launch rofi run mode"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "c", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "w", lazy.spawn(os.path.expanduser('~/.config/qtile/scripts/shutdown-menu.sh')), desc="Shutdown Menu"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

groups = [
    Group(name="1", label="WWW", matches=[]),
    Group(name="2", label="WWW", matches=[]),
    Group(name="3", label="TERM", matches=[]),
    Group(name="4", label="TERM", matches=[]),
    Group(name="5", label="SYS", matches=[]),
    Group(name="6", label="SYS", matches=[]),
    Group(name="7", label="SYS", matches=[]),
    Group(name="8", label="NOTE", matches=[]),
    Group(name="9", label="FILE", matches=[Match(wm_class="dolphin")]),
    Group(name="0", label="UTIL", matches=[Match(wm_class="discord")]),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


default_layout_settings = {
    "border_focus_stack": colors["primary"],
    "border_width": 3,
    # "margin": [12, 8, 12, 8],
    "margin": 0,
    "margin_on_single": 0,
}

layouts = [
    layout.Columns(**default_layout_settings),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(foreground="000", padding=10),
                widget.GroupBox(this_current_screen_border="#3f1700"),
                widget.Sep(foreground="000", padding=15),
                widget.WindowName(),
                widget.CurrentLayout(fmt="󰕰 {}"),
                widget.Sep(foreground="000", padding=5),
                widget.KeyboardLayout(configured_keyboards=["us", "rs -variant latin"]),
                widget.Sep(foreground="000", padding=5),
                widget.TextBox(
                    text="",
                    mouse_callbacks={
                        "Button1": lazy.spawn('pavucontrol')
                    },
                ),
                widget.PulseVolume(),
                widget.Sep(foreground="000", padding=5),
                widget.Systray(),
                widget.Sep(foreground="000", padding=5),
                widget.Clock(format="%m.%d.%Y  %a %I:%M %p"),
                widget.Sep(foreground="000", padding=8),
                widget.TextBox(
                    text="",
                    mouse_callbacks={
                        "Button1": lazy.spawn(os.path.expanduser('~/.config/qtile/scripts/shutdown-menu.sh'))
                    },
                ),
                widget.Sep(foreground="000", padding=10),
            ],
            24,
            # border_width=[0, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        wallpaper="~/Pictures/wallpaper.jpg",
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="pavucontrol"),

        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


@hook.subscribe.startup_once
def on_startup():
    os.system(os.path.expanduser('~/.config/qtile/scripts/autostart.sh'))


# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
