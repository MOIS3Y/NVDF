{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # languages and builders:
    gcc
    gnumake
    nodejs
    nodePackages.typescript
    rustc
    cargo
   
    # IDE:
    jetbrains.pycharm-community
    vscode
    neovim
    
    # helpful utils:
    git
    jq
    tree-sitter
    xclip
    mkpasswd
    postman
  ];
}
