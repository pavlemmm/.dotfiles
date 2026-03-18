{ config, pkgs, ... }:

{
  home.username = "pavlem";
  home.homeDirectory = "/home/pavlem";

  # Bitno: stavi verziju koja odgovara tvom NixOS-u (npr 24.11)
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    ripgrep
    neovim
  ];

  programs.git = {
    enable = true;
  };

  programs.zsh.enable = true;
}
