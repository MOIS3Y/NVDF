{
  config,
  pkgs,
  ... 
}: {
  imports = [
    ./configurations.nix
    ./hardware-configuration.nix
  ];
}
