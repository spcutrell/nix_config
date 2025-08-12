{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/dallas
    ../common/optional/flatpak.nix
    ../common/optional/openssh.nix
    ../common/optional/gnome.nix
    # ../common/optional/sway.nix
  ];


  networking.hostName = "narcissus";

  home-manager.users.dallas = {
    home.username = "dallas";
    home.homeDirectory = "/home/dallas";
    home-config = {
      cli.enable = true;
      shells.fish.enable = true;
      zellij.enable = true;
    };
  };
}
