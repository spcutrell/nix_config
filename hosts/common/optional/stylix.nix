{pkgs, ...}: let
  artifactDir = ../../../artifacts;
  wallpaper = "weyland.png";
in {
  stylix = {
    enable = true;
    autoEnable = true;
    image = "${artifactDir}/${wallpaper}";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";

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
}
