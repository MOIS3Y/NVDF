{ 
  config,
  pkgs,
  lib, 
  ... 
}: {
  imports = [
    ./pkgs
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "stepan";
    homeDirectory = "/home/stepan";
    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

