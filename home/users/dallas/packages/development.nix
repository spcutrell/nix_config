{ pkgs, ... }: {
  home.packages = builtins.attrValues {
    inherit (pkgs)
      devenv
      direnv
      ;
  };
}
