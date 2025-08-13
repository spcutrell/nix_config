{ lib, config, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.home-config.wezterm;
in
{
  imports = [ ./config.nix ];

  options.home-config.wezterm = {
    enable = mkEnableOption "Wezterm";
  };

  config = mkIf cfg.enable {
    programs.wezterm.enable = true;
  };

}
