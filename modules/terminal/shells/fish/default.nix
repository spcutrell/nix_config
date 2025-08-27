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

      # shellAliases = {
      #   tree = "eza --all --long --tree";
      #   mv = "mv -i";
      #   cp = "cp -ia";
      # };
    };
  };
}
