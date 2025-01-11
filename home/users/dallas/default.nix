{  ... }: {

  home.username = "dallas";
  home.homeDirectory = "/home/dallas";

  imports = [
    ./wezterm 
    ./helix
    ./packages
  ];

  # programs.fish.enable = true;
  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
