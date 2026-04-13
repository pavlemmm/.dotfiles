{ config, pkgs, inputs, ... }:

{
  ############################################################
  # System-level programs
  ############################################################

  environment.systemPackages = with pkgs; [
    ############################
    # Editors
    ############################
    neovim
    zed-editor

    ############################
    # Development
    ############################
    # LSPs
    lua-language-server
    typescript-language-server
    pyright
    nil
    tailwindcss-language-server
    emmet-ls

    # Compilers/Interpreters
    gcc
    gnumake
    nodejs
    python3

    # Dev Tools
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
    krita
    gparted

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
    fastfetch
    efibootmgr # efi boot tool
    exfatprogs # mkfs.exfat tool
    wl-clipboard # wayland clipboard
    # libnotify # lib for sending notifications
    tldr # simpler man pages

    ############################
    # Window manager utilities
    ############################
    noctalia-shell
    xwayland-satellite

    # screenshot utils
    grim
    slurp

    ############################
    # Desktop environment utilities
    ############################
    # Gnome
    gnome-tweaks

    ############################
    # Fonts
    ############################
    nerd-fonts.jetbrains-mono
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.zsh.enable = true;
}
