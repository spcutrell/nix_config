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

      window.commands = [
        { command = "inhibit_idle fullscreen"; criteria = { class = ".*"; }; }
      ];

      startup = [
        { command = "${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit"; }
      ];

      defaultWorkspace = "workspace number 1";
    };
  };
}

