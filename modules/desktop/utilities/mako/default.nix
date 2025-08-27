{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.components.mako;
in {
  options.components.mako = {
    enable = mkEnableOption "Mako";
  };

  config = mkIf cfg.enable {
    services = {
      mako = {
        enable = true;
        settings = {
          width = 300;
          height = 110;
          border-size = 2;
          border-color = "#f38ba8";
          background-color = "#1e1e2e";
          text-color = "#cdd6f4";
          border-radius = 15;
          default-timeout = 5000;
          ignore-timeout = 1;
        };
      };
    };
  };
}
