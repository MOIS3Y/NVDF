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
    python311
    poetry
   
    # IDE:
    jetbrains.pycharm-community
    vscode
    neovim
    
    # helpful utils:
    git
    jq
    tree-sitter
  ];
}
