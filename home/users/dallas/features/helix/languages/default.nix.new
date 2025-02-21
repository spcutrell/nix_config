{ lib, ... }:
let
  files = lib.filterAttrs (n: v:
    v == "regular" &&
    n != "default.nix" &&
    lib.hasSuffix ".nix" n) (builtins.readDir ./.);

  importedConfigs = lib.mapAttrsToList (name: _:
    import (./. + "/${name}")) files;

  allLanguages = lib.concatLists (map (cfg:
    cfg.language or []) importedConfigs);
in {
  language = allLanguages;
}
