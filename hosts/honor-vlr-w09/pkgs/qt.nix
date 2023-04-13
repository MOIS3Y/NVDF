# █▀█ ▀█▀ ▀
# ▀▀█ ░█░ ▄
# ---------
{pkgs, ...}:
with pkgs; [
  libsForQt5.qt5ct
  libsForQt5.qtstyleplugin-kvantum
  libsForQt5.qt5.qtgraphicaleffects  # req for sddm theme
]
