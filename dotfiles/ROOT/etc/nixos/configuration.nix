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
  boot.loader = {
    # systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      # efiInstallAsRemovable = true;

      # useOSProber = true;

      extraEntries = ''
        menuentry "Fedora" {
          chainloader /EFI/FEDORA/SHIMX64.EFI
        }
        menuentry "Reboot" {
            reboot
        }
        menuentry "Poweroff" {
            halt
        }
      '';
    };
  };

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
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    xkb = {
      layout = "us,rs,rs";
      variant = ",latin,";
      options = "grp:alt_shift_toggle,caps:escape,ctrl:swap_lalt_lctl,altwin:swap_ralt_rwin";
    };

    autoRepeatInterval = 25; # Interval between repeats (ms)
    autoRepeatDelay = 200; # Delay before repeat (ms)
  };

  services.libinput = {
    # Enable touchpad support (enabled default in most desktopManager).
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0.0";
    };
  };

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

  # Display manager
  services.displayManager = {
    ly.enable = true;
    ly.x11Support = false;
    # sddm.enable = true;
    # sddm.wayland.enable = true;
    # gdm.enable = true;
    # gdm.wayland = true;
  };

  # Enable the GNOME Desktop Environment.
  # services.desktopManager.gnome.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  # programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";

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

    inputs.affinity-nix.packages.x86_64-linux.v3

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
    discord
    transmission_4-gtk
    libreoffice
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
    bat
    nvtopPackages.amd
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
    # gnome-tweaks
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
