{ pkgs, ... }:
let
  languageConfigs = import ./languages;
in
{
  imports = [ ./settings.nix ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      # pkgs.nil
      pkgs.lsp-ai
    ];
    languages = languageConfigs;
  };
}
