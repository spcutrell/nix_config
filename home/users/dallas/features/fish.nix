{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    programs.fish.plugins = builtins.attrValues {
      inherit (pkgs.fishPlugins)
        hydro
      ;
    };

    shellAliases = {
      tree = "eza --all --long --tree";
      mv = "mv -i";
      cp = "cp -ia";
    };
  };
}
