{ config, pkgs, ... }:

{
  ############################################################
  # Bootloader (UEFI + systemd-boot)
  ############################################################

  boot.loader = {
    systemd-boot.enable = true;

    # Maximum number of generations kept in /boot
    systemd-boot.configurationLimit = 10;

    # Allow NixOS to write EFI boot entries
    efi.canTouchEfiVariables = true;

    # Explicit ESP mountpoint (safe practice)
    efi.efiSysMountPoint = "/boot";

    # grub = {
    #   enable = true;
    #   efiSupport = true;
    #   device = "nodev";
    #   # useOSProber = true;
    #   extraEntries = ''
    #     menuentry "Fedora" {
    #       chainloader /EFI/FEDORA/SHIMX64.EFI
    #     }
    #     menuentry "Reboot" {
    #         reboot
    #     }
    #     menuentry "Poweroff" {
    #         halt
    #     }
    #   '';
    # };
  };

  ############################################################
  # Automatic store maintenance
  ############################################################

  # Remove unreferenced store paths weekly
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Deduplicate identical files in /nix/store
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  nix.settings.auto-optimise-store = true;

  # Automatic updating
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  ############################################################
  # Nix configuration
  ############################################################

  # Enable flakes and new nix CLI
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable multi-core package building
  nix.settings = {
    max-jobs = "auto";
    cores = 0;
  };

  # Allow proprietary software (Steam, Discord, Brave...)
  nixpkgs.config.allowUnfree = true;

  ############################################################
  # Caching
  ############################################################

  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypb6Zp5ZrF5d1mXzV2o1kZyZ4s0="
      "nix-community.cachix.org-1:mB9Fs7Z2Z8M0R1fQ4P0Z3r3m2P6wX9cF2q1sQ3kXz1A="
    ];
  };
}
