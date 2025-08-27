{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.features.desktop.niri;

  # killall = "${pkgs.killall}/bin/killall";
  brightnessctl = getExe pkgs.brightnessctl;
  wpctl = getExe' pkgs.wireplumber "wpctl";

  playerctl = getExe pkgs.playerctl;
  # terminal = config.home.sessionVariables.TERMINAL;
  # browser = lib.getExe pkgs.firefox;
  # hyprlock = lib.getExe pkgs.hyprlock;
  # darkman = "${pkgs.darkman}/bin/darkman";
  # copyq = "${pkgs.copyq}/bin/copyq";
  # bluetui = "${pkgs.bluetui}/bin/bluetui";
in {
  options.features.desktop.niri = {
    enable = mkEnableOption "Niri";
  };

  config = mkIf cfg.enable {
    components = {
      fuzzel.enable = true;
      # hyprlock.enable = true;
      swaylock.enable = true;
      mako.enable = true;
      waybar.enable = true;
    };
    programs.niri.settings = {
      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";
      hotkey-overlay.skip-at-startup = true;
      binds = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
      in
        # lib.attrsets.mergeAttrsList [
        mergeAttrsList [
          {
            # Apps
            # "Mod+T".action = spawn terminal;
            "Mod+T".action = spawn "footclient";
            "Mod+O".action = show-hotkey-overlay;
            "Mod+D".action = spawn "fuzzel";

            # "Mod+X".action = sh "${killall} -SIGUSR1 .waybar-wrapped";
            # "Mod+O".action = sh "${copyq} show";
            # "Mod+W".action = sh "${swaync-client} -t";
            # "Mod+B".action = sh browser;
            # "Mod+P".action = sh "${terminal} ${bluetui}";
            # "Mod+Shift+T".action = sh "${darkman} toggle";
            "Mod+Backspace".action = spawn ["loginctl" "lock-session"];
          }
          {
            # Functions
            "XF86AudioPlay".action = sh "${playerctl} play-pause";
            "XF86AudioRaiseVolume".action = sh "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ 0 && ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.05+";
            "XF86AudioLowerVolume".action = sh "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ 0 && ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.05-";
            "XF86AudioMute".action = sh "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";

            "XF86MonBrightnessUp".action = sh "${brightnessctl} set 10%+";
            "XF86MonBrightnessDown".action = sh "${brightnessctl} set 10%-";

            "Print".action = screenshot;
            "Mod+Print".action = screenshot-window;
            "Alt+Print".action = screenshot-window;
          }
          {
            # Other
            # "Mod+colon".action = show-hotkey-overlay;
            "Mod+Q".action = close-window;
          }
          # Window binds
          {
            "Mod+Left".action = focus-column-left;
            "Mod+H".action = focus-column-left;
            "Mod+Ctrl+Left".action = move-column-left;
            "Mod+Shift+Left".action = focus-monitor-left;
            "Mod+Shift+Ctrl+Left".action = move-window-to-monitor-left;

            "Mod+Right".action = focus-column-right;
            "Mod+L".action = focus-column-right;
            "Mod+Ctrl+Right".action = move-column-right;
            "Mod+Shift+Right".action = focus-monitor-right;
            "Mod+Shift+Ctrl+Right".action = move-window-to-monitor-right;

            "Mod+Up".action = focus-window-up;
            "Mod+K".action = focus-window-up;
            "Mod+Ctrl+Up".action = move-window-up;
            "Mod+Shift+Up".action = focus-monitor-up;
            "Mod+Shift+Ctrl+Up".action = move-window-to-monitor-up;

            "Mod+Down".action = focus-window-down;
            "Mod+J".action = focus-window-down;
            "Mod+Ctrl+Down".action = move-window-down;
            "Mod+Shift+Down".action = focus-monitor-down;
            "Mod+Shift+Ctrl+Down".action = move-window-to-monitor-down;
          }
          {
            "Mod+V".action = switch-focus-between-floating-and-tiling;
            "Mod+Shift+V".action = toggle-window-floating;
          }
          {
            "Mod+Home".action = focus-column-first;
            "Mod+End".action = focus-column-last;
            "Mod+Ctrl+Home".action = move-column-to-first;
            "Mod+Ctrl+End".action = move-column-to-last;
          }
          {
            "Mod+U".action = focus-workspace-down;
            "Mod+Ctrl+U".action = move-window-to-workspace-down;
            "Mod+Shift+U".action = move-workspace-down;
            "Mod+I".action = focus-workspace-up;
            "Mod+Ctrl+I".action = move-window-to-workspace-up;
            "Mod+Shift+I".action = move-workspace-up;
          }
          {
            "Mod+1".action."focus-workspace" = 1;
            "Mod+2".action."focus-workspace" = 2;
            "Mod+3".action."focus-workspace" = 3;
            "Mod+4".action."focus-workspace" = 4;
            "Mod+5".action."focus-workspace" = 5;
            "Mod+6".action."focus-workspace" = 6;
            "Mod+7".action."focus-workspace" = 7;
            "Mod+8".action."focus-workspace" = 8;
            "Mod+9".action."focus-workspace" = 9;

            "Mod+Ctrl+1".action."move-window-to-workspace" = 1;
            "Mod+Ctrl+2".action."move-window-to-workspace" = 2;
            "Mod+Ctrl+3".action."move-window-to-workspace" = 3;
            "Mod+Ctrl+4".action."move-window-to-workspace" = 4;
            "Mod+Ctrl+5".action."move-window-to-workspace" = 5;
            "Mod+Ctrl+6".action."move-window-to-workspace" = 6;
            "Mod+Ctrl+7".action."move-window-to-workspace" = 7;
            "Mod+Ctrl+8".action."move-window-to-workspace" = 8;
            "Mod+Ctrl+9".action."move-window-to-workspace" = 9;
          }
          {
            # Move columns
            "Mod+Comma".action = consume-window-into-column;
            "Mod+semicolon".action = expel-window-from-column;
            "Mod+Space".action = toggle-column-tabbed-display;
            "Mod+C".action = center-column;

            # Resize columns
            "Mod+R".action = switch-preset-column-width;
            "Mod+Shift+R".action = switch-preset-window-height;
            "Mod+Ctrl+R".action = reset-window-height;
            "Mod+Ctrl+F".action = expand-column-to-available-width;
            "Mod+F".action = maximize-column;
            "Mod+Shift+F".action = fullscreen-window;

            "Mod+KP_Subtract".action = set-column-width "-10%";
            "Mod+KP_Add".action = set-column-width "+10%";
            "Mod+Shift+KP_Subtract".action = set-window-height "-10%";
            "Mod+Shift+KP_Add".action = set-window-height "+10%";

            "Mod+A".action = toggle-overview;
            "Mod+Shift+Escape".action = toggle-keyboard-shortcuts-inhibit;
            "Mod+Shift+E".action = quit;
            "Mod+Shift+P".action = power-off-monitors;

            "Mod+Shift+Ctrl+T".action = toggle-debug-tint;
          }
        ];

      input.touchpad = {
        tap = true;
        dwt = true;
        natural-scroll = true;
        click-method = "clickfinger";
      };
      layout = {
        gaps = 8;
        struts = {
          top = -4;
          bottom = -4;
          left = 4;
          right = 4;
        };
      };
    };
  };
}
