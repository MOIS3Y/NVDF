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

    # media:
    flameshot
    vlc

    # network:
    networkmanagerapplet
    networkmanager-l2tp
    networkmanager-openvpn
    networkmanager_strongswan

    gnome.networkmanager-openvpn
    gnome.networkmanager-l2tp


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
    
    #....

  ];
  home.file.".config/rofi" = {
      source = ../config/rofi;
      recursive = true;
      # onChange = builtins.readFile ../config/rofi/config.rasi;
      # executable = true;
    };
}
