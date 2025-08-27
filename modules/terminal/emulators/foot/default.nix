{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.terminal.foot;
in {
  options.features.terminal.foot = {
    enable = mkEnableOption "Foot";
  };

  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;
      server.enable = true;
      # settings = {
      #   <PUT SETTINGS HERE>
      # };
    };
  };
}
