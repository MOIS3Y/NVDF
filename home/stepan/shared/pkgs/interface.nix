{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # widgets:
    eww

    #window switcher
    rofi

    # QT5 styles:
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];
  home.file.".config/rofi" = {
      source = ../config/rofi;
      recursive = true;
      # onChange = builtins.readFile ../config/rofi/config.rasi;
      # executable = true;
    };
}

