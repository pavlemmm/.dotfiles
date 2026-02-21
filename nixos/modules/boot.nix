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
}
