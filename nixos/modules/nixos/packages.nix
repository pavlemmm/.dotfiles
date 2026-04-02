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
    gimp

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
    wl-clipboard
    tldr

    ############################
    # Window manager utilities
    ############################
    noctalia-shell
    xwayland-satellite
    swayidle

    ############################
    # Desktop environment utilities
    ############################
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
