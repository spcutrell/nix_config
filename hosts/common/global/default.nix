{ pkgs, config, ... }: {

  # System Configuration
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";

  # Core Services
  services.udisks2.enable = true;
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Security
  security.polkit.enable = true;

  # Boot Config
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = [                                                       
      (config.boot.kernelPackages.callPackage ../optional/xpad-noone.nix { })                   
    ];                                                                                 
    kernelModules = [ "xpad-noone" ];  
  };

  hardware = {
    steam-hardware.enable = true;
    xone.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Audio
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
  };

  #System software
  programs = {
    firefox.enable = true;
    fish.enable = true;
    git.enable = true;
    vim.enable = true;
  };
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        alacritty
        cachix
        curl
        file
        gnupg
        nix-output-monitor
        p7zip
        tree
        unzip
        wget
        which
        xz
        zip
        zstd
        ;
    };
    variables.EDITOR = "vim";
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "dallas" ];
  };
  nixpkgs.config.allowUnfree = true;

}
