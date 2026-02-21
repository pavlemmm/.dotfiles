{ config, pkgs, inputs, ... }:

{

  ############################################################
  # Programs
  ############################################################

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    zsh.enable = true;
  };

  ############################################################
  # System-wide installed packages
  ############################################################

  environment.systemPackages = with pkgs; [

    ############################
    # Editors
    ############################
    neovim
    zed-editor

    # Affinity (from flake input)
    inputs.affinity-nix.packages.x86_64-linux.v3

    ############################
    # Development
    ############################
    lua-language-server
    nodePackages.typescript-language-server
    pyright
    nil
    tailwindcss-language-server
    nodePackages.vscode-langservers-extracted
    emmet-ls

    gcc
    gnumake
    nodejs_24
    python3
    codex

    ############################
    # Desktop applications
    ############################
    brave
    discord
    transmission_4-gtk
    libreoffice
    vlc
    ghostty
    alacritty

    ############################
    # CLI utilities
    ############################
    git
    ripgrep
    unzip
    yazi
    zoxide
    oh-my-posh
    fzf
    eza
    bat
    tldr
    wl-clipboard
    nvtopPackages.amd

    ############################
    # Window manager utilities
    ############################
    swaylock
    swayidle
    waybar
    rofi
    gammastep
    mako
    brightnessctl
    cliphist
    grim
    slurp
    libnotify
    playerctl

    ############################
    # Fonts
    ############################
    nerd-fonts.jetbrains-mono
    inter
  ];
}
