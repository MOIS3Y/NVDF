# █▀█ █▀█ █▀█ █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀ ▀
# █▀▀ █▀▄ █▄█ █▄█ █▀▄ █▀█ █░▀░█ ▄█ ▄
# ----------------------------------
{
  config,
  pkgs,
  ...
}:{
  programs = {
    zsh = {
      enable = true;
    };
    xss-lock = {
      enable = true;
      lockerCommand = "${pkgs.i3lock-color}/bin/i3lock";
    };
    i3lock = {
      enable = true;
      package = pkgs.i3lock-color;
    };
  };
}
