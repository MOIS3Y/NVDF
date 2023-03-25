# █▄░█ █ ▀▄▀ █▀█ █▀   █░█ █▀█ █▀▄▀█ █▀▀ ▄▄ █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▀ █▀█ ▀
# █░▀█ █ █░█ █▄█ ▄█   █▀█ █▄█ █░▀░█ ██▄ ░░ █░▀░█ █▀█ █░▀█ █▀█ █▄█ ██▄ █▀▄ ▄
# -------------------------------------------------------------------------
{
  config,
  pkgs,
  ...
}: {
  home = {
    sessionVariables = {
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
