_: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jonesy
    ../common/optional/flatpak.nix
    ../common/optional/openssh.nix
    ../common/optional/gnome.nix
    ../common/optional/sway.nix
  ];

  networking.hostName = "nostromo";
}
