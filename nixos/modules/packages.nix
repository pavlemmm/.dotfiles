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
    vscode
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
    krita

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
    efibootmgr # tool for uefi boot
    exfatprogs # mkfs.exfat tool
    nvtopPackages.amd # analysis for gpu
    btop
    fastfetch

    ############################
    # Window manager utilities
    ############################
    noctalia-shell
    # quickshell

    # Niri
    xwayland-satellite # xwayland for niri
    swayidle # idle tool for niri, sway

    ############################
    # Desktop environment utilities
    ############################
    # Gnome
    gnome-tweaks

    # KDE
    # kdePackages.kcalc

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
