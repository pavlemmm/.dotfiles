# from libqtile.utils import guess_terminal
from os.path import expanduser

mod = "mod4"

# terminal = guess_terminal()
terminal = "alacritty"
file_manager = "pcmanfm"
browser = "firefox"



margin = 0
margin_on_single = 0

bar_type = "solid" # transparent or solid


# Colors
colors = {
    "primary": "#963900",
    "secondary": "#52a300",
    "unfocused": "#1a1a1a",
    "unfocused-secondary": "#2a5202",
}


rofi_path = expanduser("~/.config/rofi/scripts/")
scripts_path = expanduser("~/.config/qtile/scripts/")
