{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
  ];

  home.username = "pavlem";
  home.homeDirectory = "/home/pavlem";

  home.stateVersion = "25.11";
}
