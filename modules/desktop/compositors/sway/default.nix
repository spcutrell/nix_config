{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.desktop.sway;
in {
  options.features.desktop.sway = {
    enable = mkEnableOption "Sway";
  };

  config = mkIf cfg.enable {
    services.mako.enable = true;
    components.swaylock.enable = true;

    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";

        menu = "${pkgs.fuzzel}/bin/fuzzel";

        bars = [{command = "waybar";}];

        keybindings = lib.mkOptionDefault {
          "${modifier}+space" = "exec ${menu}";
          "${modifier}+Shift+S" = "grim -g '$(slurp)'";
          "${modifier}+Shift+F" = "fullscreen toggle";
          "${modifier}+0" = "workspace number 0";
          "${modifier}+Shift+0" = "move container to workspace number 0";
        };

        window.commands = [
          {
            command = "inhibit_idle fullscreen";
            criteria = {
              class = ".*";
            };
          }
        ];

        startup = [
          {command = "${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit";}
        ];

        defaultWorkspace = "workspace number 1";
      };
    };
  };
}
