_: {
  programs.dconf.enable = true;
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = true;
  };
}
