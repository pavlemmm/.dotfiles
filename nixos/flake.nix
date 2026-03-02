{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    hyprland.url = "github:hyprwm/Hyprland";
    # scroll.url = "github:AsahiRocks/scroll-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nix-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nix-pc/configuration.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ inputs.neovim-nightly.overlays.default ];
          })
          # inputs.scroll.nixosModules.default
        ];
      };
    };
  };
}

