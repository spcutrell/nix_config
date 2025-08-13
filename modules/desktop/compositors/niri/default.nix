{ lib, config, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.home-config.desktop.niri;
in
{
  options.home-config.desktop.niri = {
    enable = mkEnableOption "Niri";
  };

  config = mkIf cfg.enable {
    desktop-options = {
      waybar.enable = true;
      fuzzel.enable = true;
    };
  };
}
