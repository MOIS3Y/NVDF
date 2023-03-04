{
  pkgs,
  lib,
  config,
  ... 
}:

let
  # nixgl = import nixgl {} ;
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${lib.getExe pkgs.nixgl.auto.nixGLDefault} $bin \"\$@\"" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
in 

{
  home.packages = with pkgs; [
    pkgs.nixgl.auto.nixGLDefault
    (nixGLWrap pkgs.tdesktop)
    (nixGLWrap pkgs.linphone)
    (nixGLWrap pkgs.zoom-us)
    #...
  ];

  programs.alacritty = {
    package = (nixGLWrap pkgs.alacritty);
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      cursor.style = {
        shape = "Block";
        blinking = "On";
      };
      window = {
        padding.x = 10;
        padding.y = 10;
        opacity = 0.95;
        title = "Alacritty";
        dynamic_title = false;
      };
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";        # text
          dim_foreground = "#CDD6F4";    # text
          bright_foreground = "#CDD6F4"; # text
        };
        cursor = {
          text = "#1E1E2E";   # base
          cursor = "#B4BEFE"; # rosewater
        };
        #.......
        vi_mode_cursor = {
          text = "#1E1E2E";   # base
          cursor = "#B4BEFE"; # lavender
        };
        search = {
          matches = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
          focused_match = {
            foreground = "#1E1E2E"; # base
            background = "#A6E3A1"; # green
          };
          footer_bar = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
        };
        hints = {
          start = {
            foreground = "#1E1E2E"; # base
            background = "#F9E2AF"; # yellow
          };
          end = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
        };
        selection = {
          text = "#1E1E2E";       # base
          background = "#F5E0DC"; # rosewater
        };
        normal = {
          black = "#45475A";   # surface1
          red = "#F38BA8";     # red
          green = "#A6E3A1";   # green
          yellow = "#F9E2AF";  # yellow
          blue = "#89B4FA";    # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5";    # teal
          white = "#BAC2DE";   # subtext1
        };
        bright = {
          black = "#585B70";   # surface2
          red = "#F38BA8";     # red
          green = "#A6E3A1";   # green
          yellow = "#F9E2AF";  # yellow
          blue = "#89B4FA";    # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5";    # teal
          white = "#A6ADC8";   # subtext0
        };
        dim = {
          black = "#45475A";   # surface1
          red = "#F38BA8";     # red
          green = "#A6E3A1";   # green
          yellow = "#F9E2AF";  # yellow
          blue = "#89B4FA";    # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5";    # teal
          white = "#BAC2DE";   # subtext1
        };
      };
    };
  };
}


# ------------nixGL------------
# URI: https://github.com/guibou/nixGL
#
# NixGL solve the "OpenGL" problem with nix on non nixOS distros.
# It works with all mesa drivers 
# (Intel cards and "free" version for Nvidia or AMD cards), 
# Nvidia proprietary drivers, and even with hybrid configuration via bumblebee. 
# It works for Vulkan programs too.

# I found a great way to wrap a program 
# that needs to be run as a nixGL argument.
# This is very convenient 
# if you run the program not from the terminal but from .desktop.
 
# ORIGINAL issue 44 about this fix:
# https://github.com/guibou/nixGL/issues/44#issuecomment-1361524862

# All that's happening here is that nixGLWrap 
# is a function that takes a packet derivation as input.
# It then duplicates the package by adding -nixgl-wrapper to its name.
# You can find it in /nix/store/*nixgl-wrapper*
# And all the magic is that in this wrapped package the bin file is changed.
# It's just a bash script that puts nixGL in front:
# exec /nix/store/fsfzvbvkpf9az1kg104ghl1ypclydsr4-nixGL/bin/nixGL
# /nix/store/n6ms57z3gsi4kaim5lw4av-alacritty-0.11.0/bin/alacritty "$@"
# it even allows you to add arguments to the wrapped command.

# ~/.nix-profile/bin/alacritty
# will link to the wrapped bin file
# alacritty -> 
# /nix/store/g1cms8aja0gabpigc8d-alacritty-0.11.0-nixgl-wrapper/bin/alacritty

# So you don't have to run anymore
# nixGL alacritty
# just run 
# alacritty 
# ------------nixGL------------