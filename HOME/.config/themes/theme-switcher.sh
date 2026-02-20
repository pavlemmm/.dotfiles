#!/usr/bin/env bash

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

# ---- Alacritty ----
ln -sfn "$THEME_DIR/alacritty/colors.toml" "$HOME/.config/alacritty/colors.toml"

# ---- Neovim ----
ln -sfn "$THEME_DIR/nvim/colorscheme.lua" "$HOME/.config/nvim/lua/colorscheme.lua"

# ---- Rofi ----
ln -sfn "$THEME_DIR/rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

# ---- Waybar ----
ln -sfn "$THEME_DIR/waybar/theme.css" "$HOME/.config/waybar/theme.css"

# ---- Mako ----
ln -sfn "$THEME_DIR/mako/config" "$HOME/.config/mako/config"

# ---- Sway ----
ln -sfn "$THEME_DIR/sway/theme.conf" "$HOME/.config/sway/modules/theme.conf"

# ---- Hyprland ----
ln -sfn "$THEME_DIR/hypr/colors.conf" "$HOME/.config/hypr/modules/colors.conf"

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
