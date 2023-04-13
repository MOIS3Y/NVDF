# █▄░█ █ ▀▄▀ █▀█ █▄▀ █▀▀ █▀ ▀
# █░▀█ █ █░█ █▀▀ █░█ █▄█ ▄█ ▄
# https://search.nixos.org/packages
# ---------------------------
{
  pkgs,
  config,
  ...
}: let
  core = import ./core.nix { inherit pkgs; };
  cli = import ./cli.nix { inherit pkgs; };
  gui = import ./gui.nix { inherit pkgs; };
  media = import ./media.nix { inherit pkgs; };
  qt = import ./qt.nix { inherit pkgs; };
in {
  imports = [ ./fonts.nix ];
  environment.systemPackages = with pkgs;
    [
      figlet
      pfetch
    ]
    ++ core
    ++ cli
    ++ gui
    ++ media
    ++ qt;
}
