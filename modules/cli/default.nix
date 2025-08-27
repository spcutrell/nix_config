{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.cli;
in {
  options.features.cli = {
    enable = mkEnableOption "CLI tools and enhancements";
  };

  config = mkIf cfg.enable {
    programs = {
      bat.enable = true;
      eza.enable = true;
      fzf.enable = true;
      jq.enable = true;
      nnn.enable = true;
      ripgrep.enable = true;
      zoxide = {
        enable = true;
        options = ["--cmd j"];
      };
    };

    home.shellAliases = {
      cat = "bat";
      tree = "eza --all --long --tree";
      mv = "mv -i";
      cp = "cp -ia";
    };
  };
}
