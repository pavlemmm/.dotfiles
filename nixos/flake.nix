{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    # hyprland.url = "github:hyprwm/Hyprland";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nix-pc =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nix-pc

          # Overlay for neovim nightly
          ({ ... }: {
            nixpkgs.overlays = [ inputs.neovim-nightly.overlays.default ];
          })

          ## Enable Home-Manager module
          # inputs.home-manager.nixosModules.home-manager

          ## Home-Manager NixOS options
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.backupFileExtension = "bak";
          #
          #   home-manager.users.pavlem = import ./home/pavlem;
          # }
        ];
      };
  };
}
