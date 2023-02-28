{
  description = "Home Manager configuration for my Void Linux workstation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    nixpkgs,
    home-manager,
    nixgl,
    ... 
    }:
    let
      # system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nixgl.overlay ];
      };
    in {
      homeConfigurations = {
        # msi workstation:
        workstation = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/stepan/workstation ];
          extraSpecialArgs = { inherit nixgl; };
        # honor laptop:
        #...
        };
      };
      packages.x86_64-linux.nixgl = pkgs.nixgl.auto.nixGLDefault;
    };
}

