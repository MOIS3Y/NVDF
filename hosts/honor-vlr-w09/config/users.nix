# █░█ █▀ █▀▀ █▀█ █▀ ▀
# █▄█ ▄█ ██▄ █▀▄ ▄█ ▄
# -------------------
{
  config,
  pkgs,
  ... 
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    stepan = {
      isNormalUser = true;
      hashedPassword = "$6$fgwgtm5pImEwfZAJ$hrYxH8KyjyaIGf0ZLrU0Imt2XyqL70QNnplxBe9KmG6O1GtaJFwKVjoxdw69x46GFaldlAFvSxEyU63lbLPwJ/";
      description = "Stepan Zhukovsky";
      extraGroups = [ 
        "networkmanager"
        "wheel"
        "audio"
      ];
      # Uncomment to install pkgs without home-manager
      # packages = with pkgs; [
      #   firefox
      # ];
    };
    # Add more users:
    # ...
  };
}
