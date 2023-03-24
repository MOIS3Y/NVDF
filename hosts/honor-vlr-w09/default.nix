# █░█ █▀█ █▄░█ █▀█ █▀█ ▄▄ █░█ █░░ █▀█ ▄▄ █░█░█ █▀█ █▀█
# █▀█ █▄█ █░▀█ █▄█ █▀▄ ░░ ▀▄▀ █▄▄ █▀▄ ░░ ▀▄▀▄▀ █▄█ ▀▀█
# ----------------------------------------------------
{
  config,
  pkgs,
  ... 
}: {
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  imports = [
    ./config
    ./services
    ./pkgs
  ];
}
