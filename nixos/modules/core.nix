{ config, pkgs, ... }:

{
  ############################################################
  # Core system identity and global settings
  ############################################################

  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";

  ############################################################
  # Networking
  ############################################################

  networking.networkmanager.enable = true;

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
  # Nix configuration
  ############################################################

  # Enable flakes and new nix CLI
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow proprietary software (Steam, Discord, Brave...)
  nixpkgs.config.allowUnfree = true;
}
