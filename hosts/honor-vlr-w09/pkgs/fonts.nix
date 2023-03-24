# █▀▀ █▀█ █▄░█ ▀█▀ █▀ ▀
# █▀░ █▄█ █░▀█ ░█░ ▄█ ▄
# ---------------------
{
  config,
  pkgs,
  ...
}: {
  fonts = {
    fonts = with pkgs; [
      # nerdfonts
      cantarell-fonts
      fira
      lato
      maple-mono
      maple-mono-NF
      maple-mono-SC-NF
      material-symbols
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto-slab
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "hintfull";
      };
      defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "DejaVu Sans" ];
        monospace = [ "DejaVu Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
