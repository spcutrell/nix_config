{ pkgs, ... }: {
  programs.direnv.enable = true;

  home.packages = builtins.attrValues {
    inherit (pkgs)
      devenv
      ;
  };
}
