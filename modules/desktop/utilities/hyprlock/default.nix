{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.components.hyprlock;
  dpms =
    if config.features.desktop.niri.enable
    then {
      on = "niri msg output --power on";
      off = "niri msg output --power off";
    }
    else {
      on = "xset dpms force on";
      off = "xset dpms force off";
    };
in {
  options.components.hyprlock = {
    enable = mkEnableOption "Hyprlock";
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
        };

        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        label = [
          {
            text = "$TIME";
            font_size = "150";
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, 25%";
            valign = "bottom";
            # monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            # placeholder_text = "Password...";
            shadow_passes = 2;
          }
        ];
      };
    };

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = dpms.on;
          before_sleep_cmd = "loginctl lock-session";
          lock_cmd = "pidof hyprlock || hyprlock";
        };

        listener = [
          {
            timeout = 270; # 4.5 minutes
            on-timeout = "notify-send 'Screen Lock' 'Locking in 30 seconds' -u normal";
          }
          {
            timeout = 300; # 5 minutes
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330; # 5.5 minutes - turn off screen 30 seconds after lock
            on-timeout = dpms.off;
            on-resume = dpms.on;
          }
          {
            timeout = 1800; # 30 minutes - suspend system
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
