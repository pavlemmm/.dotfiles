#!/usr/bin/env bash

set -e

dir="$HOME/.dotfiles/dotfiles/HOME/.config/dconf"

dconf load / < "$dir"/config.dconf
