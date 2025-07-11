from libqtile.lazy import lazy
from libqtile import hook
import subprocess
from libqtile.log_utils import logger
from libqtile.core.manager import Qtile

# AUTOSTART
@hook.subscribe.startup_once
def on_startup():
    subprocess.Popen("~/.config/qtile/scripts/autostart.sh", shell=True)




# WINDOWS TO GROUPS
windows_to_groups = {
    # window class   allowed groups   fallback group
    "firefox": (["WWW"], "1"),
    "Alacritty": (["TERM", "DEV", "NOTE"], "2"),
    "Pcmanfm": (["FILE"], "8"),
    "discord": (["UTIL"], "9"),
}


@hook.subscribe.client_new
def new_clients(c):
    window_class = c.get_wm_class()[1]
    current_group = c.qtile.current_group.label
    if window_class not in windows_to_groups:
        return

    allowed_groups, fallback = windows_to_groups[window_class]
    if current_group not in allowed_groups:
        c.togroup(fallback)


def float_to_front():
    @lazy.function
    def __inner(qtile: Qtile):
        for window in qtile.current_group.windows:
            logger.warning(dir(window))
            if window.floating:
                if window.hidden:
                    window.unhide()
                else:
                    window.hide()
    return __inner


# CUSTOM
def executeShellCmd(cmd):
    @lazy.function
    def __inner(qtile: Qtile):
        subprocess.Popen(cmd, shell=True)
    return __inner



def getShellOut(cmd):
    return subprocess.check_output(cmd).strip().decode()
