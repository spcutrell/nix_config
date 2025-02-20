{ ... }: {
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.nnn.enable = true;
  programs.ripgrep.enable = true;
  programs.zoxide = {
    enable = true;
    options = [
      "--cmd j"
    ];
  };

  home.shellAliases = {
    cat = "bat";
    tree = "eza --all --long --tree";
    mv = "mv -i";
    cp = "cp -ia";
  };
}
