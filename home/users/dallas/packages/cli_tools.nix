{ ... }: {

  programs.nnn.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.bat.enable = true;
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  home.shellAliases = {
    cat = "bat";
  };
}
