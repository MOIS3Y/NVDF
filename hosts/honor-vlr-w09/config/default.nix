# █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█ █▀ ▀
# █▄▄ █▄█ █░▀█ █▀░ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█ ▄█ ▄
# https://search.nixos.org/options
# ------------------------------------------------------
{
  config,
  pkgs,
  ... 
}: {
  config = {
    allowUnfree = true;
    pulseaudio = true;
  };
  imports = [
    ./boot.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./locales.nix
    ./networking.nix
    ./users.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11"; # Did you read the comment?
}
