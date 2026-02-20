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

link() {
  ln -sfn "$THEME_DIR/$1" "$HOME/.config/$2" 2>/dev/null || return
  echo "linked -> $2"
}

echo "Switching theme to: $THEME"

link "nvim/colorscheme.lua"   "nvim/lua/colorscheme.lua"
link "ghostty/theme"          "ghostty/theme"
link "alacritty/colors.toml"  "alacritty/colors.toml"
link "rofi/theme.rasi"        "rofi/theme.rasi"
link "waybar/theme.css"       "waybar/theme.css"
link "mako/config"            "mako/config"
link "sway/theme.conf"        "sway/modules/theme.conf"
link "hypr/colors.conf"       "hypr/modules/colors.conf"

# ---- Reload compositor ----
if [ -n "$SWAYSOCK" ]; then
    swaymsg reload
elif [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    hyprctl reload
fi

# ---- Reload waybar ----
pkill -USR2 waybar || true

# ---- Reload mako ----
if command -v mako >/dev/null 2>&1; then
  makoctl reload
fi

# ---- Reload ghostty ----
if command -v ghostty >/dev/null 2>&1; then
    ghostty +reload-config >/dev/null 2>&1 || true
fi

echo "Theme '$THEME' applied successfully"
