{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # scroll.url = "github:AsahiRocks/scroll-flake";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nix-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nix-pc/configuration.nix

          ## Home-Manager module
          # inputs.home-manager.nixosModules.home-manager
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.backupFileExtension = "bak";
          #
          #   home-manager.users.pavlem = import ./home/pavlem;
          # }

          ## Enable Scroll WM
          # inputs.scroll.nixosModules.default
        ];
      };
    };
  };
}
