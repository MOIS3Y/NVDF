# █▀▀ █░░ █ ▀
# █▄▄ █▄▄ █ ▄
# ----------- 
{pkgs, ...}:
with pkgs; [
  alsa-lib
  alsa-plugins
  alsa-tools
  alsa-utils
  arandr
  bottom
  brightnessctl
  cmatrix
  curl
  efibootmgr
  efitools
  exfatprogs
  gammastep
  git
  gnome.gnome-keyring  # for ssh-agent
  htop
  iw
  lsd
  neofetch
  neovim
  nmap
  ntfs3g
  ocl-icd
  pamixer
  patchelf
  playerctl
  pciutils
  ranger
  slop
  smartmontools
  unzip
  usbutils
  tree
  tty-clock
  wget
  wirelesstools
  xkb-switch  # require for QTILE keyboard layout switch
  zip
]
