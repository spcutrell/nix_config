{ pkgs, ... }: {
  home.packages = builtins.attrValues {
    inherit (pkgs)
      p7zip
      unzip
      xz
      zip
      zstd
      ;
  };
}
