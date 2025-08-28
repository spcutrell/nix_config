{lib, ...}: let
  inherit (lib) mkDefault;
in {
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";

  #SANE DEFAULTS
  features = {
    cli.enable = mkDefault true;
    helix.enable = mkDefault true;
    terminal.foot.enable = mkDefault true;
  };
}
