{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.terminal.wezterm;
in {
  imports = [./config.nix];

  options.features.terminal.wezterm = {
    enable = mkEnableOption "Wezterm";
  };

  config = mkIf cfg.enable {
    programs.wezterm.enable = true;
  };
}
