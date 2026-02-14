# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Belgrade";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,rs,rs";
    variant = ",latin,";
    options = "grp:alt_shift_toggle,caps:escape,ctrl:swap_lalt_lctl,altwin:swap_ralt_rwin";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Opengl and drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      vulkan-validation-layers
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
    ];
  };

  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;

  # GDM display manager
  services.displayManager.gdm.wayland = true;
  services.displayManager.gdm.enable = true;

  # Sway 
  programs.sway.enable = true;
  # Niri
  programs.niri.enable = true;

  # Portals (file picker, screensharing, etc.)
  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  # services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pavlem = {
    isNormalUser = true;
    description = "PavleM";
    extraGroups = [
      # Sudo
      "wheel"

      # Network
      "networkmanager"

      # Virtualization
      "docker"
      "libvirtd"
      "kvm"
    ];
    shell = pkgs.zsh;
  };

  # Virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    docker.enable = true;

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Allow flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable zsh
  programs.zsh.enable = true;

  # Enable steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Development
    neovim
    zed-editor

    # LSP Servers for NeoVIM
    lua-language-server
    nodePackages.typescript-language-server
    pyright
    nil
    tailwindcss-language-server
    nodePackages.vscode-langservers-extracted
    emmet-ls

    # Base
    gcc
    gnumake
    ripgrep
    unzip

    # Dev Tools
    nodejs_24
    python3
    codex

    # Desktop Apps
    brave
    libreoffice
    discord
    transmission_4-gtk
    ghostty
    vlc

    # Fonts
    nerd-fonts.jetbrains-mono

    # CLI Tools
    git
    yazi
    zoxide
    oh-my-posh
    fzf
    eza
    wl-clipboard
    tldr

    # WM
    swaylock
    swayidle
    waybar
    rofi
    gammastep
    alacritty
    mako
    brightnessctl
    cliphist
    grim
    slurp
    libnotify
    playerctl

    # Gnome
    gnome-tweaks
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
