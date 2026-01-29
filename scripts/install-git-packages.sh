#!/usr/bin/env bash

# Install hyprun
git clone https://github.com/pavlemmm/hyprun.git $HOME/hyprun
( cd $HOME/hyprun || exit
sudo mv hyprun.py /usr/local/bin/hyprun
rm -rf $HOME/hyprun )

