{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # widgets:
    eww

    # QT5 styles:
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];
}

