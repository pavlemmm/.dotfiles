#!/usr/bin/env bash

grim -g "$(slurp)" - | wl-copy || exit 1
