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
    ./society.nix
  ];
}
    # society:
    # mattermost-desktop


    # media:
    # vlc
    # kazam
    # flameshot
