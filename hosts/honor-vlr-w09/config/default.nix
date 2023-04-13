# █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█ █▀ ▀
# █▄▄ █▄█ █░▀█ █▀░ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█ ▄█ ▄
# https://search.nixos.org/options
# ------------------------------------------------------
{
  config,
  pkgs,
  ... 
}: {
  imports = [
    ./boot.nix
    ./environment.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./locales.nix
    ./networking.nix
    ./systemd.nix
    ./users.nix
  ];
}
