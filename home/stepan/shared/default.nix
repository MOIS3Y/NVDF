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
  # paths it should manage:
  home = {
    username = "stepan";
    homeDirectory = "/home/${config.home.username}";

    sessionVariables = {
      # Fix exec rofi from nixpkgs:
      LOCALES_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      # Fix display .desktop_files:
      XDG_DATA_DIRS = "/usr/share:/usr/local/share:/home/${config.home.username}/.nix-profile/share";
      # Just test var:
      TEST_VAR = "do_you_see_me";
    };
    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;  
}

