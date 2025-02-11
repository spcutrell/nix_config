{ pkgs, ... }: {
  home.packages = builtins.attrValues {
    inherit (pkgs)
      bat
      eza
      fzf
      jq
      nnn
      ripgrep
      yq-go
      ;
  };

  home.shellAliases = {
    ls = "eza";
    cat = "bat";
  };
}
