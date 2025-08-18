{lib, ...}: let
  inherit (lib) mkDefault;
in {
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";

  #SANE DEFAULTS
  home-config = {
    cli.enable = mkDefault true;
    helix.enable = mkDefault true;
    terminal.foot.enable = mkDefault true;
    # desktop.gnome.enable = mkDefault true;
  };
  # gui.enable = lib.mkDefault true;

  # gaming.enable = lib.mkDefault false;
  # virtualization.enable = lib.mkDefault false;
}
