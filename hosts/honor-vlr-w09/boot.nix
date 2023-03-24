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
        hash = "sha256-e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
        stripRoot = false;
      };
    };
  };
}
