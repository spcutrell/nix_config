{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/dallas
    ../common/optional/amd.nix
    ../common/optional/flatpak.nix
    ../common/optional/gnome.nix
    ../common/optional/openssh.nix
    ../common/optional/steam.nix
  ];

  services.udisks2.enable = true;
  security.polkit.enable = true;

  networking.hostName = "nostromo";

  boot.extraModulePackages = [                                                       
    (config.boot.kernelPackages.callPackage ./xpad-noone.nix { })                   
  ];                                                                                 
  boot.kernelModules = [ "xpad-noone" ];  

  system.stateVersion = "24.05";

}
