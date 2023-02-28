{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    vlc
    flameshot
  ];
}

