{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # browsers:
    firefox
    
    # fs:
    xfce.thunar
    gparted

    #media:
    flameshot
    vlc

    # sound:
    pulseaudioFull
    pavucontrol

    #society:
    mattermost-desktop

    # window managers:
    qtile 

    # widgets:
    eww

    #window switcher
    rofi
    rofi-bluetooth

    # QT5 styles:
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum

    # GTK styles:
    lxappearance
    
    #....

  ];
  home.file.".config/rofi" = {
      source = ../config/rofi;
      recursive = true;
      # onChange = builtins.readFile ../config/rofi/config.rasi;
      # executable = true;
    };
}
