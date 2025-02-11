{ ... }: {

  home.username = "dallas";
  home.homeDirectory = "/home/dallas";

  imports = [
    ./packages
    ./features/fish.nix
    ./features/ghostty.nix
    ./features/gnome.nix
    ./features/helix
    ./features/wezterm
  ];

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
