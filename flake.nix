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
    lib = nixpkgs.lib // home-manager.lib;
    systems = [ "x86_64-linux" ];
    name = "Alpha Short";

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (
      system:
      import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      }
    );
  in {
    inherit lib;
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    overlays = import ./overlays { inherit inputs; };

    packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs inputs; });
    devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
    formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

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
          inherit inputs outputs name;
	  username = "alphashort";
	  email = "robertrivarola060@gmail.com";
          hostname = "venus";
        };
        modules = [
          ./home/alphashort/venus.nix
        ];
      };
    };
  };
}
