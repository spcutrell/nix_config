{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/dallas
    ../common/optional/amd.nix
    ../common/optional/flatpak.nix
    ../common/optional/gnome.nix
    ../common/optional/openssh.nix
    # ../common/optional/steam.nix
  ];

  services.udisks2.enable = true;

  networking.hostName = "nostromo";

  system.stateVersion = "24.05";

}
