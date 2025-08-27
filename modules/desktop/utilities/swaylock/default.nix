{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.components.swaylock;
in {
  options.components.swaylock = {
    enable = mkEnableOption "Swaylock";
  };

  config = mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      timeouts = [
        # {
        #   timeout = 10; # 300 - 10 seconds
        #   command = "${pkgs.libnotify}/bin/notify-send -u normal 'Screen will lock in 10 seconds'";
        # }
        {
          timeout = 300;
          command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
          resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
        }
        {
          timeout = 900;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock}/bin/swaylock -f";
        }
        {
          event = "lock";
          command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
        }
        {
          event = "unlock";
          command = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
        }
        {
          event = "after-resume";
          command = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
        }
      ];
    };
  };
}
