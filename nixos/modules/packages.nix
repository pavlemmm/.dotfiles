{ config, pkgs, inputs, ... }:

{
  ############################################################
  # System-level programs
  ############################################################

  environment.systemPackages = with pkgs; [
    ############################
    # IDEs and Tools
    ############################
    # Terminals
    wezterm
    # ghostty
    # alacritty

    # IDEs
    neovim
    zed-editor
    # code-cursor
    # vscode

    # Dev Tools
    codex

    ############################
    # Development
    ############################
    # LSPs
    lua-language-server
    typescript-language-server
    pyright
    clang-tools
    nil
    tailwindcss-language-server
    emmet-ls

    # Compilers/Interpreters
    gcc
    gnumake
    nodejs
    python3

    ############################
    # Web Browsers
    ############################
    # chromium
    librewolf
    brave
    # inputs.zen-browser.packages.${pkgs.system}.default

    ############################
    # Desktop applications
    ############################
    krita
    # gparted
    onlyoffice-desktopeditors
    discord
    transmission_4-gtk
    vlc

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
    fastfetch
    bat # better cat cmd
    btop-rocm # better top, rocm=amd cuda=nvidia
    efibootmgr # efi boot tool
    exfatprogs # mkfs.exfat tool
    wl-clipboard # wayland clipboard
    # libnotify # lib for sending notifications
    tldr # simpler man pages

    ############################
    # Window manager utilities
    ############################
    noctalia-shell
    # xwayland-satellite

    # screenshot utils
    grim
    slurp

    ############################
    # Desktop environment utilities
    ############################
    # Gnome
    gnome-tweaks

    # KDE
    # qalculate-qt # qt calculator
    # libsForQt5.qt5ct # styling for qt5
    # qt6Packages.qt6ct # styling for qt6
    # mission-center # system monitor replacement for WMs
  ];

  ############################
  # Fonts
  ############################
  fonts = {
    fontconfig.defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.zsh.enable = true;
}
