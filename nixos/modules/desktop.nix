{ config, pkgs, ... }:

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

  # Enable the GNOME Desktop Environment.
  # services.desktopManager.gnome.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  # programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";

  # Sway 
  programs.sway.enable = true;
  # Niri
  programs.niri.enable = true;

  ############################################################
  # Portals (file pickers, screen sharing, etc.)
  ############################################################

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
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
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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
  # Other services
  ############################################################

  services.printing.enable = true;
  services.flatpak.enable = true;
}
