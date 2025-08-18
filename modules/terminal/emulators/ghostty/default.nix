{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.home-config.terminal.ghostty;
in {
  options.home-config.terminal.ghostty = {
    enable = mkEnableOption "Ghostty";
  };

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      # settings = {
      #   <PUT SETTINGS HERE>
      # };
    };
  };
}
