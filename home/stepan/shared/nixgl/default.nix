{
  pkgs,
  lib,
  ... 
}:

let
  # ------------nixGL------------
  # ORIGINAL issue 44 about this fix:
  # https://github.com/guibou/nixGL/issues/44#issuecomment-1361524862
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
  # ------------nixGL------------
in 

{
  home.packages = with pkgs; [
    pkgs.nixgl.auto.nixGLDefault
    (nixGLWrap pkgs.alacritty)
    # (nixGLWrap pkgs.tdesktop)
    # (nixGLWrap pkgs.linphone)
    # (nixGLWrap pkgs.zoom-us)
    #...
  ];
}

