{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe';

  wpctl = getExe' pkgs.wireplumber "wpctl";
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = ["niri/workspaces"];
        modules-center = ["clock"];
        modules-right = ["wireplumber" "network" "battery" "tray"];

        "niri/workspaces" = {
          format = "{name}";
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        wireplumber = {
          format = "{volume}% {icon}";
          format-muted = "󰝟 MUTED";
          format-icons = ["󰕿" "󰖀" "󰕾"];
          on-click = "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ 0 && ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.05+";
          on-scroll-down = "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ 0 && ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.05-";
          max-volume = 100;
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "PWR: {capacity}%";
          format-charging = "󱐌 {capacity}%"; # White lightning bolt
          format-plugged = "󱐋 {capacity}%";
          format-alt = "{time}";
        };

        tray = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(43, 48, 59, 0.9);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      button:hover {
        background: inherit;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }

      #clock, #battery, #wireplumber, #network, #tray {
        padding: 0 10px;
        color: #ffffff;
      }

      #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: #26A65B;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
