{
  description = "My nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs outputs;};
    nixosConfigurations = {
      venus = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          hostname = "venus";
        };
        modules = [
          ./hosts/venus
        ];
      };
    };
    homeConfigurations = {
      "alphashort@venus" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {
          inherit inputs outputs;
          hostname = "venus";
        };
        modules = [
          ./home/alphashort/venus.nix
        ];
      };
    };
  };
}
