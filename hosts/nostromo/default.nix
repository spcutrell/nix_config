{ config, pkgs, ... }: {
  imports = [ 
      ./hardware-configuration.nix
      ../common/global
      ../common/users/dallas
      ../common/optional/amd.nix
      ../common/optional/gnome.nix
      ../common/optional/flatpak.nix
  ];

  services.udisks2.enable = true;

  networking.hostName = "nostromo";

  system.stateVersion = "24.05";

}
