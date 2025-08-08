{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/dallas
    ../common/optional/gnome.nix
    ../common/optional/sway.nix
  ];

  networking.hostName = "narcissus";
}
