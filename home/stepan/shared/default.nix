# █░█ █▀█ █▀▄▀█ █▀▀ ▄▄ █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▀ █▀█
# █▀█ █▄█ █░▀░█ ██▄ ░░ █░▀░█ █▀█ █░▀█ █▀█ █▄█ ██▄ █▀▄

# █▀▀ █▄░█ ▀█▀ █▀█ █▄█ █▀█ █▀█ █ █▄░█ ▀█▀
# ██▄ █░▀█ ░█░ █▀▄ ░█░ █▀▀ █▄█ █ █░▀█ ░█░

{ 
  config,
  pkgs,
  lib, 
  ... 
}: {
  # Home Manager needs a bit of information about you and the 
  # paths it should manage:
  home = {
    username = "stepan";
    homeDirectory = "/home/${config.home.username}";

    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;  
}
