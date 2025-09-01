{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.zellij;
in {
  options.features.zellij = {
    enable = mkEnableOption "Enable Zellij with options";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableFishIntegration = config.programs.fish.enable;
      exitShellOnExit = true;
    };
    xdg.configFile."zellij/config.kdl".source = ./zellij_config.kdl;
  };
}
