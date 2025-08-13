{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    # settings = {};
  };
  programs.xwayland.enable = true;
}
