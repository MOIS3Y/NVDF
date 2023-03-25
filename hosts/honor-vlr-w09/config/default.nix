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
    ./hardware.nix
    ./hardware-configuration.nix
    ./locales.nix
    ./networking.nix
    ./users.nix
  ];
}
