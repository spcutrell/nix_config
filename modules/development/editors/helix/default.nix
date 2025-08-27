{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.features.helix;
  languagesDir = ./languages;
  languageConfigs = {
    language =
      builtins.readDir languagesDir
      |> lib.filterAttrs (n: v: v == "regular" && n != "default.nix" && lib.hasSuffix ".nix" n)
      |> lib.mapAttrsToList (name: _: import (languagesDir + "/${name}"))
      |> lib.concatMap (cfg: cfg.language or []);
  };
in {
  imports = [./settings.nix];

  options.features.helix = {
    enable = mkEnableOption "Helix configuration";
  };

  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      extraPackages = [
        pkgs.lsp-ai
      ];
      languages = languageConfigs;
      package = inputs.helix.packages.${pkgs.system}.default;
    };
  };
}
