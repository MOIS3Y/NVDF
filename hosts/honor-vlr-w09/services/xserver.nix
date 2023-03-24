# ▀▄▀ █▀ █▀▀ █▀█ █░█ █▀▀ █▀█ ▀
# █░█ ▄█ ██▄ █▀▄ ▀▄▀ ██▄ █▀▄ ▄
# ----------------------------
{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    # dpi = 144;
    layout = "us,ru";
    xkbVariant = "";
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
      };
    };
    displayManager = {
      gdm = {
        enable = true;
      };
      sddm = {
        enable = false;
      };
    };
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
    windowManager = {
      qtile = {
        enable = true;
      };
    };
  };
}
