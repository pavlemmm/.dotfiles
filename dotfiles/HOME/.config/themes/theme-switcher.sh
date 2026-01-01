#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <theme>"
    exit 1
fi

THEME="$1"
BASE="$HOME/.config/themes"
THEME_DIR="$BASE/$THEME"

# ---- HELP / LIST ----
if [ "$1" == "ls" ]; then
    ls -1 "$BASE" | grep -v '\.sh$'
    exit 0
fi

if [ ! -d "$THEME_DIR" ]; then
    echo "Theme '$THEME' not found!"
    exit 1
fi

echo "Switching theme to: $THEME"

# ---- Core links ----
ln -sfn "$THEME_DIR/alacritty/colors.toml" "$HOME/.config/alacritty/colors.toml"

ln -sfn "$THEME_DIR/nvim/colorscheme.lua" "$HOME/.config/nvim/lua/colorscheme.lua"

ln -sfn "$THEME_DIR/rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

ln -sfn "$THEME_DIR/waybar/theme.css" "$HOME/.config/waybar/theme.css"

# ---- Sway ----
ln -sfn "$THEME_DIR/sway/theme.conf" "$HOME/.config/sway/modules/theme.conf"

# ---- Hyprland ----
ln -sfn "$THEME_DIR/hypr/colors.conf" "$HOME/.config/hypr/modules/colors.conf"

# ---- Mako ----
ln -sfn "$THEME_DIR/mako/config" "$HOME/.config/mako/config"

# ---- Reload compositor ----
if [ -n "$SWAYSOCK" ]; then
    swaymsg reload
elif [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    hyprctl reload
fi

# ---- Reload waybar ----
pkill -USR2 waybar || true

# ---- Reload mako ----
makoctl reload

echo "Theme '$THEME' applied successfully"
