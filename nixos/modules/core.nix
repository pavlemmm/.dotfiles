{ config, pkgs, ... }:

{
  ############################################################
  # Core system identity and global settings
  ############################################################

  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";

  ############################################################
  # User configuration
  ############################################################

  users.users.pavlem = {
    isNormalUser = true;
    description = "PavleM";

    # Groups define system permissions
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

  ############################################################
  # Networking
  ############################################################

  networking.networkmanager.enable = true;

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
}
