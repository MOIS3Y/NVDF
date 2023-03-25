# █▀ █░█ █▀▀ █░░ █░░ ▀
# ▄█ █▀█ ██▄ █▄▄ █▄▄ ▄
# --------------------
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
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      ll = "ls -l";
      docker = "sudo docker";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = ["git"];
    };
  };
  # ▄▀█ █░░ ▄▀█ █▀▀ █▀█ █ ▀█▀ ▀█▀ █▄█
  # █▀█ █▄▄ █▀█ █▄▄ █▀▄ █ ░█░ ░█░ ░█░
  # ---------------------------------
  programs.alacritty = {
    package = pkgs.alacritty;
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      shell = {
        program = "${lib.getExe pkgs.zsh.out}";
        # args = ["--login"]
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
