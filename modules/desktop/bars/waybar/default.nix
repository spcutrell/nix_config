{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.desktop-options.waybar;
in
{
  options.desktop-options.waybar = {
    enable = mkEnableOption "Waybar and configuration";
  };

  config = mkIf cfg.enable {
    programs.waybar.enable = true;
  };
}
