# █▄░█ █ ▀▄▀ █▀█ █▄▀ █▀▀ █▀ ▀
# █░▀█ █ █░█ █▀▀ █░█ █▄█ ▄█ ▄
# https://search.nixos.org/packages
# ---------------------------
{
  config,
  pkgs,
  ... 
}: {
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk
  ];
  imports = [
    ./cli.nix
    ./fonts.nix
  ];
}
