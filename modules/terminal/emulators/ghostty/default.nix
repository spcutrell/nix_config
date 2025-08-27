{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.terminal.ghostty;
in {
  options.features.terminal.ghostty = {
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
