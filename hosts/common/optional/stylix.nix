  { ... }:
  let
    artifactDir = ../../../artifacts;
    wallpaper = "queen.png";
  in { 
    stylix = {
      enable = true;
      image = "${artifactDir}/${wallpaper}";
    };
  }

