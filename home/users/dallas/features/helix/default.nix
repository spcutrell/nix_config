{ pkgs, lib, ... }:
let
  languagesDir = ./languages;
  languageConfigs = {
    language =
      builtins.readDir languagesDir
      | > lib.filterAttrs (n: v:
        v == "regular" &&
        n != "default.nix" &&
        lib.hasSuffix ".nix" n)
      |> lib.mapAttrsToList (name: _:
    import (languagesDir + "/${name}"))
    |> lib.concatMap(cfg: cfg.language or [])
    ;
  };
in
{
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
