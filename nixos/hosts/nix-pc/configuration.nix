{ config, pkgs, inputs, ... }:

{
  # Import hardware and logical modules
  imports = [
    ./hardware-configuration.nix

    ../../modules/core.nix
    ../../modules/system.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
  ];

  # Host-specific configuration
  networking.hostName = "nix-pc";

  # DO NOT change after first install unless you know what you're doing
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11";
}
