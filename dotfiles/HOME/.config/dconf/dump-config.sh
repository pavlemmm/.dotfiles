#!/usr/bin/env bash

set -e

dir="$HOME/.dotfiles/dotfiles/HOME/.config/dconf"

mv "$dir"/config.dconf "$dir"/config.dconf.bak
dconf dump / > "$dir"/config.dconf
