{
  pkgs,
  lib,
  ... 
}:{
  imports = [
    ./cli.nix
    ./develop.nix
    ./interface.nix
    ./media.nix
    ./nixgl.nix
    ./shell.nix
    ./society.nix
    ./xdg.nix
  ];
}
