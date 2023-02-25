{
  description = "Home Manager configuration for my Void Linux workstation";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixgl, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [ nixgl.overlay ];
    in {
      homeConfigurations.void = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          # hyprland.homeManagerModules.default
          # {wayland.windowManager.hyprland.enable = true;}
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

