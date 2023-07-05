from libqtile import layout
from libqtile.bar import Gap
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# from libqtile.log_utils import logger
from os.path import expanduser
from settings import *
from custom_functions import *

from bar_transparent import bar as bar_transparent
from bar_solid import bar as bar_solid



ROFI_PATH = expanduser("~/.config/rofi/scripts/")

# KEYBINDINGS
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
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
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "b", lazy.hide_show_bar("top"), desc="Hides the bar"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod],
        "space",
        lazy.layout.toggle_split(),
        desc="Toggle split",
    ),
    Key(
        [mod],
        "c",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout",
    ),
    # Launchers
    Key([mod], "a", lazy.spawn(ROFI_PATH + "launcher.sh"), desc="Launch rofi launcher"),
    Key(
        [mod, "shift"],
        "a",
        lazy.spawn(ROFI_PATH + "allapps.sh"),
        desc="Launch rofi all apps",
    ),
    Key([mod], "o", lazy.spawn(ROFI_PATH + "window.sh"), desc="Launch rofi window"),
    Key(
        [mod],
        "q",
        executeShellCmd(ROFI_PATH + "shortcuts.sh"),
        desc="Launch rofi shortcuts",
    ),
    Key(
        [],
        "Print",
        executeShellCmd(ROFI_PATH + "screenshot.sh"),
        desc="Launch rofi printscreen menu",
    ),
    Key(
        [mod, "shift"],
        "w",
        executeShellCmd(ROFI_PATH + "powermenu.sh"),
        desc="Launch rofi power menu",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "c", lazy.reload_config(), desc="Reload the config"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# GROUPS
groups = [
    Group(name="1", label="WWW"),
    Group(name="2", label="TERM"),
    Group(name="3", label="DEV"),
    Group(name="4", label="SYS"),
    Group(name="5", label="SYS"),
    Group(name="6", label="SYS"),
    Group(name="7", label="NOTE"),
    Group(name="8", label="FILE"),
    Group(name="9", label="UTIL"),
    Group(name="0", label="WWW"),
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


# LAYOUTS

layouts = [
    layout.Columns(
        border_focus=colors["primary"],
        border_focus_stack=colors["secondary"],
        border_normal=colors["unfocused"],
        border_normal_stack=colors["unfocused-secondary"],
        border_width=2,
        margin=margin,
        margin_on_single=margin,
    ),
    layout.Max(margin=margin),
    # layout.Floating(),
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


# WIDGETS
widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar_transparent if bar_type == "transparent" else bar_solid,
        bottom=Gap(margin),
        left=Gap(margin),
        right=Gap(margin),
        wallpaper="~/Pictures/mountains.jpg",
        wallpaper_mode="stretch",
    ),
]

# MOUSE
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


# FLOATING RULES
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



# SETTINGS
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


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
