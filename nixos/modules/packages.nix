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
    qalculate-qt # qt calculator
    libsForQt5.qt5ct # styling for qt5
    qt6Packages.qt6ct # styling for qt6

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
