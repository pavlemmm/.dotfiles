from libqtile import layout
from libqtile.bar import Gap
from libqtile.config import Click, Drag, Group, EzKey, Match, Screen
from libqtile.lazy import lazy

from settings import *
from custom_functions import *

from bar_transparent import bar as bar_transparent
from bar_solid import bar as bar_solid


# KEYBINDINGS
keys = [
    # Switch between windows
    EzKey("M-h", lazy.layout.left()),
    EzKey("M-l", lazy.layout.right()),
    EzKey("M-j", lazy.layout.down()),
    EzKey("M-k", lazy.layout.up()),
    EzKey("M-f", lazy.window.toggle_floating()),
    EzKey("M-S-f", lazy.window.toggle_fullscreen()),
    EzKey("M-S-h", lazy.layout.shuffle_left()),
    EzKey("M-S-l", lazy.layout.shuffle_right()),
    EzKey("M-S-j", lazy.layout.shuffle_down()),
    EzKey("M-S-k", lazy.layout.shuffle_up()),
    EzKey("M-C-h", lazy.layout.grow_left()),
    EzKey("M-C-l", lazy.layout.grow_right()),
    EzKey("M-C-j", lazy.layout.grow_down()),
    EzKey("M-C-k", lazy.layout.grow_up()),
    EzKey("M-n", lazy.layout.normalize()),
    EzKey("M-b", lazy.hide_show_bar("top")),
    EzKey("M-<Tab>", lazy.next_layout()),
    EzKey("M-<space>", lazy.layout.toggle_split()),
    EzKey("M-c", lazy.widget["keyboardlayout"].next_keyboard()),

    EzKey("M-<equal>", lazy.spawn('pactl set-sink-volume @DEFAULT_SINK@ +10%')),
    EzKey("M-S-<equal>", executeShellCmd(scripts_path + 'toggle_app.sh pavucontrol')),
    EzKey("M-<minus>", lazy.spawn('pactl set-sink-volume @DEFAULT_SINK@ -10%')),
    # EzKey("M-S-<minus>", lazy.spawn('pactl set-sink-mute @DEFAULT_SINK@ toggle')), # Mute speaker
    EzKey("M-S-<minus>", lazy.spawn('pactl set-source-mute @DEFAULT_SOURCE@ toggle')), # Mute microphone

    # Launchers
    EzKey("M-a", lazy.spawn(rofi_path + "launcher.sh")),
    EzKey("M-S-a", lazy.spawn(rofi_path + "allapps.sh")),
    EzKey("M-o", lazy.spawn(rofi_path + "window.sh")),
    EzKey("M-s", executeShellCmd(rofi_path + "shortcuts.sh")),
    EzKey("<Print>", executeShellCmd(rofi_path + "screenshot.sh")),
    EzKey("M-S-w", executeShellCmd(rofi_path + "powermenu.sh")),
    EzKey("M-<Return>", lazy.spawn(terminal)),
    EzKey("M-e", lazy.spawn(file_manager)),
    EzKey("M-g", float_to_front()),
    EzKey("M-q", lazy.spawn(browser)),
    EzKey("M-w", lazy.window.kill()),
    EzKey("M-S-c", lazy.reload_config()),
    # EzKey("M-r", lazy.spawncmd()),
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
            EzKey(f"M-{i.name}", lazy.group[i.name].toscreen()),
            EzKey(f"M-S-{i.name}", lazy.window.togroup(i.name, switch_group=True)),
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
        margin_on_single=margin_on_single,
    ),
    layout.Max(margin=margin_on_single),
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
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry

        # Custom
        Match(wm_class="pavucontrol"),
        Match(wm_class="kalk"),
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
