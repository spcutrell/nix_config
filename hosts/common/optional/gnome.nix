{pkgs, ...}: {
  programs.dconf.enable = true;
  services = {
    xserver.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  environment.gnome = {
    excludePackages = with pkgs; [gnome-tour gnome-user-docs];
  };
}
