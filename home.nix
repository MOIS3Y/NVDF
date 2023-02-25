{ config, pkgs, lib, ... }:

# https://nix-community.github.io/home-manager/

let
  # ------------nixGL------------
  # Install nixGL and fix "OpenGL" problem with nix
  # https://github.com/guibou/nixGL
  # NOTICE:
  # Don't foget add nixGL chanell before use home-manager:
  # nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl
  # nix-channel --update
  # ORIGINAL issue 44 about this fix:
  # https://github.com/guibou/nixGL/issues/44#issuecomment-1361524862
  nixgl = import <nixgl> {} ;
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${lib.getExe nixgl.auto.nixGLDefault} $bin \"\$@\"" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
  # ------------nixGL------------
in 


{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "stepan";
  home.homeDirectory = "/home/stepan";

  home.packages = with pkgs; [
    
    # apps with nixgl-wrapper:
    nixgl.auto.nixGLDefault
    (nixGLWrap pkgs.alacritty)
    (nixGLWrap pkgs.tdesktop)
    (nixGLWrap pkgs.linphone)
    (nixGLWrap pkgs.zoom-us)
    #...

    # test pkgs:
    cmatrix
    tty-clock
    neofetch

    # society:
    mattermost-desktop

    #develop:
    mkpasswd
    git
    jetbrains.pycharm-community
    vscode
    neovim
    tree-sitter
    xclip
    postman


    # files:
    ranger

    # network:
    wget
    nmap

    # monitoring:
    htop
    bottom

    # media:
    vlc
    kazam
    flameshot
    alsa-lib

    # stylesheet:
    eww
    sassc
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum

    # tiling wm

    # languages and builders:
    gcc
    gnumake
    nodejs
    nodePackages.typescript
    rustc
    cargo
  ];

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Catppuccin-Mocha-Standard-Dark";
  #     package = pkgs.catppuccin-gtk.override {
  #       accents = [ 
  #         "blue" 
  #         # "flamingo"
  #         # "green"
  #         # "lavender"
  #         # "maroon" 
  #         # "mauve" 
  #         # "peach"
  #         # "pink"
  #         # "red"
  #         # "rosewater"
  #         # "sapphire"
  #         # "sky"
  #         # "teal"
  #         # "yellow"
  #         ];
  #       variant = "mocha";
  #     };
  #   };
  # };  

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

