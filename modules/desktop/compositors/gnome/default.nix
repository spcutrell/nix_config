{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.desktop.gnome;
in {
  options.features.desktop.gnome = {
    enable = mkEnableOption "Gnome";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.gnomeExtensions.paperwm
      pkgs.rose-pine-gtk-theme
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.paperwm.extensionUuid
        ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        switch-input-source = [];
        switch-input-source-backward = [];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control><Alt>t";
        command = "footclient";
        name = "Foot";
      };

      #Nautilus
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
      };

      # "org/gnome/desktop/interface" = {
      #   # gtk-theme = "Adwaita-dark";
      #   gtk-theme = "rose-pine-dawn";
      #   icon-theme = "Papirus-Dark";  # Try: Papirus, Papirus-Dark, Adwaita
      #   # color-scheme = "prefer-dark";
      #   cursor-theme = "Adwaita";
      # };

      # PaperWM
      "org/gnome/shell/extensions/paperwm" = {
        # CONFIG
        "show-focus-mode-icon" = false;
        "show-open-position-icon" = false;
        "show-window-position-bar" = false;
        "show-workspace-indicator" = false;
        "default-focus-mode" = 1;
        "swipe-sensitivity" = [4.0 4.0];
        "swipe-friction" = [2.0 2.0];

        # BINDINGS
        # move-left = [ "<Super>h" ];
        # move-right = [ "<Super>l" ];
      };
    };
    gtk = {
      enable = true;
      theme = {
        name = "rose-pine-dawn";
        package = pkgs.rose-pine-gtk-theme;
      };
    };
  };
}
