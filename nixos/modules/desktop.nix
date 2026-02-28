{ config, pkgs, inputs, ... }:

{
  ############################################################
  # X11 configuration and input
  ############################################################

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

  ############################################################
  # Display manager
  ############################################################

  services.displayManager = {
    ly.enable = true;
    ly.x11Support = false;
    # sddm.enable = true;
    # sddm.wayland.enable = true;
    # gdm.enable = true;
    # gdm.wayland = true;
  };

  ############################################################
  # Desktop environments and WMs
  ############################################################

  # Enable the GNOME Desktop Environment
  services.desktopManager.gnome.enable = true;

  # Enable the KDE Plasma Desktop Environment
  # services.desktopManager.plasma6.enable = true;
  # programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  
  # Enable the Sway Window Manager
  # programs.sway.enable = true;

  # Enable the Niri Window Manager
  programs.niri.enable = true;

  # Enable the Hyprland Window Manager
  # programs.hyprland.enable = true;

  # Enable the Scroll Window Manager
  # programs.scroll = {
  #   enable = true;
  #   package = inputs.scroll.packages.${pkgs.stdenv.hostPlatform.system}.scroll-stable;
  # };

  ############################################################
  # Power Managing
  ############################################################

  services.logind.settings.Login = {
    IdleAction = "suspend-then-hibernate";
    IdleActionSec = "15min";   # posle 15 min neaktivnosti krene suspend
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=45min    # posle 45 min u suspendu pređe u hibernate
  '';

  ############################################################
  # Portals (file pickers, screen sharing, etc.)
  ############################################################

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-gnome
      # xdg-desktop-portal-gtk
    ];
  };

  ############################################################
  # Audio stack (PipeWire)
  ############################################################

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  # services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;

    # compatibility with others
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  ############################################################
  # Graphics and OpenGL/Vulkan
  ############################################################

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

  ############################################################
  # Virtualization
  ############################################################

  programs.virt-manager.enable = true;
  virtualisation = {
    docker.enable = true;

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  ############################################################
  # Other services
  ############################################################

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
