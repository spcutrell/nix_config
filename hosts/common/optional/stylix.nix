{pkgs, ...}: let
  artifactDir = ../../../artifacts;
  wallpaper = "weyland.png";
in {
  stylix = {
    enable = true;
    image = "${artifactDir}/${wallpaper}";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
  };
}
