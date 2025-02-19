{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;     
  };

  home.packages = builtins.attrValues {
    inherit (pkgs)
      devenv
      ;
  };
}
