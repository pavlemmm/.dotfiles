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

  # Allow proprietary software (Steam, Discord, Brave...)
  nixpkgs.config.allowUnfree = true;

  ############################################################
  # Caching
  ############################################################

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
