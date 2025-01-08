{ pkgs, ... }: {
  imports = [
    ./locale.nix
    ./nix.nix
  ];
  
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


  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim 
    wget
  ];

  environment.variables.EDITOR = "vim";


}
