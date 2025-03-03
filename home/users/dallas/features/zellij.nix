{ ... }: {
  stylix.targets.zellij.enable = true;
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    # settings = {
    #   <Put settings here>
    # };
  };
}
