{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.home-config.desktop.gnome;
in {
  options.home-config.desktop.gnome = {
    enable = mkEnableOption "Gnome";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.gnomeExtensions.paperwm
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          # pkgs.gnomeExtensions.paperwm.extensionUuid
        ];
      };

      # Configure individual extensions
      # "org/gnome/shell/extensions/paperwm" = { };
    };
  };
}
