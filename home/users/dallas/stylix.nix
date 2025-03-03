{ pkgs, ... }:
let
  artifactDir = ../../../artifacts;
  wallpaper = "queen.png";
  # nf = pkgs.nerd-fonts;
in { 
  stylix = {
    targets.gtk.flatpakSupport.enable = false;
    image = "${artifactDir}/${wallpaper}";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    # fonts = {}
  };
}

