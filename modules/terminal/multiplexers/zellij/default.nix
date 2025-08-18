{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.home-config.zellij;
in {
  options.home-config.zellij = {
    enable = mkEnableOption "Enable Zellij with options";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableFishIntegration = config.programs.fish.enable;
      # settings = {
      #   <Put settings here>
      # };
    };
  };
}
