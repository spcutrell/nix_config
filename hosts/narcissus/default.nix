{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jonesy
    ../common/optional/flatpak.nix
    ../common/optional/openssh.nix
    ../common/optional/gnome.nix
    ../common/optional/fprintd.nix
    ../common/optional/stylix.nix
  ];

  networking.networkmanager.wifi.powersave = true;
  networking.hostName = "narcissus";

  home-manager.users = {
    jonesy = {
      home = {
        username = "jonesy";
        homeDirectory = "/home/jonesy";
        packages = [
          (pkgs.retroarch.withCores (cores:
            with cores; [
              genesis-plus-gx
              snes9x
              beetle-psx-hw
            ]))
        ];
      };
      features = {
        cli.enable = true;
        shells.fish.enable = true;
        zellij.enable = true;
        desktop.gnome.enable = true;
        terminal.ghostty.enable = true;
      };

      stylix = {
        image = ../../artifacts/weyland.png;
        # base16Scheme = "${pkgs.base16-schemes}/share/themes/brushtrees-dark.yaml";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
        targets.gtk.enable = false;
      };
    };
  };
}
