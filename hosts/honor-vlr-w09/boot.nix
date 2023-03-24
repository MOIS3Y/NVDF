# █▄▄ █▀█ █▀█ ▀█▀ ▀
# █▄█ █▄█ █▄█ ░█░ ▄
# -----------------
{
  config,
  pkgs,
  ...
}: {

  # Bootloaders:
  # ------------

  # SYSTEMD-EFI:
  # ------------
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # GRUB 2:
  # -------
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      version = 2;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 3;
      gfxmodeEfi = "1920x1080";
      theme = pkgs.fetchzip {
        # https://github.com/AdisonCavani/distro-grub-themes
        url = https://github.com/AdisonCavani/distro-grub-themes/releases/download/v3.1/huawei.tar;
        hash = "sha256-024d4130813015818dfcc13a9e7fa7041d5d58999737f898520b954081198af0";
        stripRoot = false;
      };
    };
  };
}
