{
  pkgs,
  lib,
  ... 
}:{
  imports = [
    ./cli.nix
    ./develop.nix
    ./gui.nix
  ];
}
