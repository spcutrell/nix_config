{ ... }: {

  home.username = "dallas";
  home.homeDirectory = "/home/dallas";

  imports = [
    ./features/cli_enhancements.nix
    ./features/developers_tools.nix
    ./features/fish.nix
    ./features/fonts.nix
    ./features/ghostty.nix
    ./features/gnome.nix
    ./features/helix
    ./features/wezterm
    ./features/zellij.nix
  ];

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
