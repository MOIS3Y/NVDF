{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives:
    zip
    unzip
    unrar
    
    # fs:
    xfce.thunar
    ranger
    tree
    lsd

    # monitoring:
    htop
    bottom
    neofetch

    # network:
    wget
    curl
    nmap

    # funny:
    cmatrix
    tty-clock

    # xserver
    xkb-switch
    
    # ...

  ];
}
