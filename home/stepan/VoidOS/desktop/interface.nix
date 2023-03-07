{
  config,
  pkgs,
  ...
}: {
  # home.packages = with pkgs; [
  #   catppuccin-kvantum
  # ];

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ 
          "blue" 
          # "flamingo"
          # "green"
          # "lavender"
          # "maroon" 
          # "mauve" 
          # "peach"
          # "pink"
          # "red"
          # "rosewater"
          # "sapphire"
          # "sky"
          # "teal"
          # "yellow"
          ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
  };
  # copy wallpapers: 
  home.file."${config.xdg.dataHome}/wallpapers" = {
      source = ../../shared/assets/wallpapers;
      recursive = true;
    };  
}
