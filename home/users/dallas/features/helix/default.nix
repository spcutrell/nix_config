{ pkgs, lib, ... }:
let
  languagesDir = ./languages;
  files = lib.filterAttrs (n: v:
    v == "regular" &&
    n != "default.nix" &&
    lib.hasSuffix ".nix" n) (builtins.readDir languagesDir);

  importedConfigs = lib.mapAttrsToList (name: _:
    import (languagesDir + "/${name}")) files;

  allLanguages = lib.concatLists (map (cfg:
    cfg.language or []) importedConfigs);

  languageConfigs = { language = allLanguages; };
in {
  imports = [ ./settings.nix ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      pkgs.lsp-ai
    ];
    languages = languageConfigs;
  };
}
