#!/usr/bin/env bash

sudo nix-collect-garbage -d # delete every generation except active
sudo nix store optimise # remove duplicate from nix store
sudo nix store gc # garbage collect nix store
