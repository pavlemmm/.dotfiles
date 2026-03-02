{ config, pkgs, inputs, ... }:

{
  ############################################################
  # System-wide installed packages
  ############################################################

  environment.systemPackages = with pkgs; [

    ############################
    # Editors
    ############################
    neovim
    helix
    zed-editor

    ############################
    # Development
    ############################

    # LSPs
    lua-language-server
    nodePackages.typescript-language-server
    pyright
    nil
    tailwindcss-language-server
    nodePackages.vscode-langservers-extracted
    emmet-ls

    # Compilers/Interpreters
    gcc
    gnumake
    nodejs
    python3
    
    # Tools
    codex

    ############################
    # Desktop applications
    ############################
    chromium
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
    nvtopPackages.amd # analysis for gpu
    efibootmgr # tool for uefi boot
    btop
    exfatprogs # mkfs.exfat tool

    ############################
    # Window manager utilities
    ############################
    xwayland-satellite # xwayland for niri
    # quickshell
    noctalia-shell
    swayidle # idle tool for niri, sway

    ############################
    # Desktop environment utilities
    ############################
    gnome-tweaks

    ############################
    # Fonts
    ############################
    nerd-fonts.jetbrains-mono
  ];

  ############################################################
  # Other programs
  ############################################################

  programs = {
    zsh.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    # dms-shell = {
    #   enable = true;
    #   systemd.enable = false;
    # };
  };
}
