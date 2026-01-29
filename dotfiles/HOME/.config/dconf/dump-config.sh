#!/bin/bash

mv $HOME/.config/dconf/config.dconf $HOME/.config/dconf/config.dconf.bak
dconf dump / > $HOME/.config/dconf/config.dconf
