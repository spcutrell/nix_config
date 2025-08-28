{pkgs, ...}: let
  artifactDir = ../../../artifacts;
  wallpaper = "weyland.png";
in {
  # https://coolors.co/373f51-80a1c1-f7a9a8-d6d6b1-ffc145
  stylix = {
    enable = true;
    autoEnable = true;
    image = "${artifactDir}/${wallpaper}";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
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
}
