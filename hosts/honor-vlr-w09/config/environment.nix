# █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▀▀ █▄░█ █░█ ▀
# █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   ██▄ █░▀█ ▀▄▀ ▄
# ----------------------------------------
{
  config,
  lib,
  pkgs,
  ...
}: {
  environment = with pkgs; {
    variables = {
    "QT_QPA_PLATFORMTHEME"= "qt5ct";
    "PYTHONDONTWRITEBYTECODE" = "1";
    };
    binsh = lib.getExe bash;
    shells = [ zsh ];
    pathsToLink = [ "/share/zsh" ];
    loginShellInit = ''
      dbus-update-activation-environment --all
      eval $(gnome-keyring-daemon --start --daemonize --components=pkcs11,secrets,ssh)
      eval $(ssh-agent)
    '';
  };
}
