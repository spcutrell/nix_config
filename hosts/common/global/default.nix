{ pkgs, ... }: {
  imports = [
    ./locale.nix
    ./nix.nix
  ];

  programs.fish.enable = true;

  networking.networkmanager.enable = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services.printing.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      alacritty
      cachix
      file
      fuzzel
      git
      gnupg
      tree
      vim
      wget
      which
      ;
  };

  environment.variables.EDITOR = "vim";


}
