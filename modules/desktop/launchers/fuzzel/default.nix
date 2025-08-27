{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.components.fuzzel;
in {
  options.components.fuzzel = {
    enable = mkEnableOption "Fuzzel";
  };

  config = mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.foot}/bin/footclient";
          layer = "overlay";
        };
        # colors.background = "ffffffff";
      };
    };
  };
}
