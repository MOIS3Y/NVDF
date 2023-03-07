{
  config,
  pkgs,
  ...
}: {
  xsession.enable = true;
  imports = [
    ./picom.nix
  ];
}
