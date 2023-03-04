{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    dotDir = ".config/zsh";
    history = {
      save = 10000;
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = 1;
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      ll = "ls -l";
      vpm = "sudo vpm";
      vsv = "sudo vsv";
      docker = "sudo docker";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = ["git"];
    };
  };
}
