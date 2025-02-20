{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    programs.fish.plugins = builtins.attrValues {
      inherit (pkgs.fishPlugins)
        z
        hydro
      ;
    };

    shellInit = ''
      set -U Z_CMD "j"
    '';

    shellAliases = {
      tree = "eza --all --long --tree";
      mv = "mv -i";
      cp = "cp -ia";
    };
  };
}
