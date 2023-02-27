{
  pkgs,
  lib,
  ... 
}:

{
  home.packages = with pkgs; [

    # test pkgs:
    cmatrix
    tty-clock
    neofetch

    # society:
    # mattermost-desktop

    #develop:
    # mkpasswd
    # git
    # jetbrains.pycharm-community
    # vscode
    # neovim
    # tree-sitter
    # xclip
    # postman


    # files:
    # ranger

    # network:
    # wget
    # nmap

    # monitoring:
    # htop
    # bottom

    # media:
    # vlc
    # kazam
    # flameshot

    # stylesheet:
    # eww
    # sassc
    # libsForQt5.qt5ct
    # libsForQt5.qtstyleplugin-kvantum

    # tiling wm

    # languages and builders:
    # gcc
    # gnumake
    # nodejs
    # nodePackages.typescript
    # rustc
    # cargo
  ];
}

