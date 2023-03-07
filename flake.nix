# █▀▀ █░░ ▄▀█ █▄▀ █▀▀
# █▀░ █▄▄ █▀█ █░█ ██▄

{
  description = ''
    Reproducible declarative configuration for my Linux systems.
    Contains configuration as for NixOS and for Void Linux.
  '';

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
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nixgl.overlay ];
      };
    in {
      homeConfigurations = {
        # Void Linux declarative pkgs config:
        # --------------------------------------------------
        VoidOS = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/stepan/VoidOS ];
          extraSpecialArgs = { inherit nixgl; };

        # NixOS Linux declarative pkgs config:
        # --------------------------------------------------
        # NixOS = home-manager.lib.homeManagerConfiguration {
        #   inherit pkgs;
        #   modules = [ ./home/stepan/NixOS ];
        #...
        };
      };
      packages.x86_64-linux.nixgl = pkgs.nixgl.auto.nixGLDefault;
    };
}

