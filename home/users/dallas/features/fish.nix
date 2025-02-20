{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    plugins = [{
      name = "hydro";
      src = pkgs.fishPlugins.hydro.src;
    }];

    shellAliases = {
      tree = "eza --all --long --tree";
      mv = "mv -i";
      cp = "cp -ia";
    };
  };
}
