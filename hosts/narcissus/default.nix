_: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jonesy
    ../common/optional/flatpak.nix
    ../common/optional/openssh.nix
    ../common/optional/gnome.nix
  ];

  networking.networkmanager.wifi.powersave = true;
  networking.hostName = "narcissus";

  home-manager.users = {
    jonesy = {
      home.username = "jonesy";
      home.homeDirectory = "/home/jonesy";
      features = {
        cli.enable = true;
        shells.fish.enable = true;
        zellij.enable = true;
        desktop.gnome.enable = true;
      };
    };
  };
}
