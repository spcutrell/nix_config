{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/dallas
    ../common/optional/flatpak.nix
    ../common/optional/gnome.nix
    ../common/optional/openssh.nix
    ../common/optional/stylix.nix
  ];

  networking.hostName = "nostromo";

  system.stateVersion = "24.05";

}
