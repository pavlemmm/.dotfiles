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
    # ly.enable = true;
    # ly.x11Support = false;
    # sddm.enable = true;
    # sddm.wayland.enable = true;
    gdm.enable = true;
    gdm.wayland = true;
  };

  ############################################################
  # Desktop environments and WMs
  ############################################################

  # Enable the GNOME Desktop Environment
  services.desktopManager.gnome.enable = true;

  # Enable the KDE Plasma Desktop Environment
  # services.desktopManager.plasma6.enable = true;
  
  # Enable the Sway Window Manager
  programs.sway.enable = true;

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
  # Portals (file pickers, screen sharing, etc.)
  ############################################################

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  ############################################################
  # Session Variables
  ############################################################

  environment.sessionVariables = {
    # Apps fix to use wayland
    QT_QPA_PLATFORM = "wayland;xcb"; # Qt apps
    GDK_BACKEND = "wayland,x11"; # GTK apps
    ELECTRON_OZONE_PLATFORM_HINT = "wayland"; # Electron
    MOZ_ENABLE_WAYLAND = "1"; # Firefox
    NIXOS_OZONE_WL = "1"; # Electron
    
    # Java GUI fix
    _JAVA_AWT_WM_NONREPARENTING = "1";
    
    # Cursor
    XCURSOR_SIZE = "20";
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
