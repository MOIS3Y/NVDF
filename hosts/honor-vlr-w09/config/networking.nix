# █▄░█ █▀▀ ▀█▀ █░█░█ █▀█ █▀█ █▄▀ █ █▄░█ █▀▀ ▀
# █░▀█ ██▄ ░█░ ▀▄▀▄▀ █▄█ █▀▄ █░█ █ █░▀█ █▄█ ▄
# -------------------------------------------
{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "honor";
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-l2tp
        pkgs.networkmanager_strongswan
        pkgs.gnome.networkmanager-openvpn
      ];
    };
  };
}
