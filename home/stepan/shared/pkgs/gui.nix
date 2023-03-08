{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # fs:
    xfce.thunar
    gparted

    # media:
    flameshot
    vlc

    #society:
    mattermost-desktop

    #....

  ];
}
