{ 
  config,
  pkgs,
  lib, 
  ... 
}: {
  imports = [
    ./pkgs
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "stepan";
    homeDirectory = "/home/stepan";
    stateVersion = "22.11";
  };

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Catppuccin-Mocha-Standard-Dark";
  #     package = pkgs.catppuccin-gtk.override {
  #       accents = [ 
  #         "blue" 
  #         # "flamingo"
  #         # "green"
  #         # "lavender"
  #         # "maroon" 
  #         # "mauve" 
  #         # "peach"
  #         # "pink"
  #         # "red"
  #         # "rosewater"
  #         # "sapphire"
  #         # "sky"
  #         # "teal"
  #         # "yellow"
  #         ];
  #       variant = "mocha";
  #     };
  #   };
  # };  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

