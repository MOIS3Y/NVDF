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


    jq
    # ...

  ];
}

