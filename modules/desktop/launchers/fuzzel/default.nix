{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.desktop-options.fuzzel;
in
{
  options.desktop-options.fuzzel = {
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
