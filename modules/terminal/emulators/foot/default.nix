{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.home-config.terminal.foot;
in {
  options.home-config.terminal.foot = {
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
