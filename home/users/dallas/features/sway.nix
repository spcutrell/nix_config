{ lib, pkgs, ... }: {
  services.mako.enable = true;

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
      }
      {
        timeout = 840;
        command = "${pkgs.libnotify}/bin/notify-send -u critical 'System will sleep in 1 minute'";
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
        command = "swaymsg 'output * dpms off'";
      }
      {
        event = "after-resume";
        command = "swaymsg 'output * dpms on'";
      }
    ];
  };

  home.packages = [ pkgs.waybar ];
  programs.waybar.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = rec {

      modifier = "Mod4";

      menu = "${pkgs.fuzzel}/bin/fuzzel";

      bars = [{ command = "waybar"; }];

      keybindings = lib.mkOptionDefault {
        "${modifier}+space" = "exec ${menu}";
        "${modifier}+Shift+S" = "grim -g '$(slurp)'";
        "${modifier}+Shift+F" = "fullscreen toggle";
        "${modifier}+0" = "workspace number 0";
        "${modifier}+Shift+0" = "move container to workspace number 0";
      };
    };
  };
}

