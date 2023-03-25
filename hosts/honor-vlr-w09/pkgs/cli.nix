# █▀▀ █░░ █ ▀
# █▄▄ █▄▄ █ ▄
# -----------
{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # archives:
    zip
    unzip
    
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

    # xserver
    xkb-switch

    # develop
    git
    neovim
    # ...
  ];
}
