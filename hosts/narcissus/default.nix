{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jonesy
    ../common/optional/flatpak.nix
    ../common/optional/openssh.nix
    ../common/optional/gnome.nix
    ../common/optional/fprintd.nix
  ];

  networking.networkmanager.wifi.powersave = true;
  networking.hostName = "narcissus";

  home-manager.users = {
    jonesy = {
      home.username = "jonesy";
      home.homeDirectory = "/home/jonesy";
      features = {
        cli.enable = true;
        shells.fish.enable = true;
        zellij.enable = true;
        desktop.gnome.enable = true;
      };

      stylix = {
        enable = true;
        autoEnable = true;
        image = ../../artifacts/weyland.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/brushtrees-dark.yaml";

        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.inconsolata;
            name = "Inconsolata Nerd Font Mono";
          };
          sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
          };
          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };

          sizes = {
            applications = 12;
            terminal = 11;
            desktop = 10;
            popups = 10;
          };
        };

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        targets.qt.enable = false;
      };
    };
  };
}
