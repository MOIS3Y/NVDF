# █░█ █▀█ █ █▀▄   █░░ █ █▄░█ █░█ ▀▄▀   █▀▀ █▄░█ ▀█▀ █▀█ █▄█ █▀█ █▀█ █ █▄░█ ▀█▀
# ▀▄▀ █▄█ █ █▄▀   █▄▄ █ █░▀█ █▄█ █░█   ██▄ █░▀█ ░█░ █▀▄ ░█░ █▀▀ █▄█ █ █░▀█ ░█░
{
  config,
  pkgs,
  ...
}: {

  home = {
    sessionVariables = {
      # Fix exec rofi from nixpkgs:
      LOCALES_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      # Fix display .desktop_files:
      XDG_DATA_DIRS = "/usr/share:/usr/local/share:/home/${config.home.username}/.nix-profile/share";
      # Fix nixpkgs zoom-us:
      QT_XCB_GL_INTEGRATION = "xcb_egl";
      # Fix QT5 stylesheet gtk:
      QT_QPA_PLATFORMTHEME = "qt5ct";
      # Disable create __pycache__:
      PYTHONDONTWRITEBYTECODE=1;
      # Just test var:
      TEST_VAR = "do_you_see_me";
    };
  };

  imports = [
    # Shared configuration
    ../shared
    ../shared/pkgs

    # Specific configuration
    ./desktop
    ./pkgs
    ./services
  ];
}

