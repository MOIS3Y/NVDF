# █▀ █▀█ █▀▀ █ █▀▀ ▀█▀ █▄█ ▀
# ▄█ █▄█ █▄▄ █ ██▄ ░█░ ░█░ ▄
# --------------------------
{
  pkgs,
  lib,
  config,
  ... 
}: {
  home.packages = with pkgs; [
    firefox
    tdesktop
    linphone
    zoom-us
    #...
  ];
}
