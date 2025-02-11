{ pkgs, ... }: {
  home.packages = [
    pkgs.gnomeExtensions.paperwm
  ];

  dconf = {
    enable = true;
    settings = {
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
