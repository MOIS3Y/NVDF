# █▀ █▄█ █▀ ▀█▀ █▀▀ █▀▄▀█ █▀▄ ▀
# ▄█ ░█░ ▄█ ░█░ ██▄ █░▀░█ █▄▀ ▄
# -----------------------------
{
  config,
  pkgs,
  ...
}: {
  systemd = {
    user.services = {
      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
      touchegg-client = {
        description = "Touchégg. The client.";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.touchegg}/bin/touchegg";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
      nm-applet = {
        description = "Network Manager applet";
        wantedBy = [ 
          "network-online.target"
          "graphical-session.target"
        ];
        wants = [
          "network-online.target"
          "graphical-session.target"
        ];
        after = [
          "network-online.target"
          "graphical-session.target"
        ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
