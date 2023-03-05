{
  config,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    name = "Apple-Cursor";
    package = pkgs.apple-cursor;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Dark";
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
      name = "Tela-Circle";
      package = pkgs.tela-circle-icon-theme;
    };
  }; 
}
