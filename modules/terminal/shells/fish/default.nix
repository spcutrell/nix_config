{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.shells.fish;
in {
  options.features.shells.fish = {
    enable = mkEnableOption "Fish plugins and enhancements";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;

      plugins = [
        {
          name = "hydro";
          src = pkgs.fishPlugins.hydro.src;
        }
      ];
    };
  };
}
