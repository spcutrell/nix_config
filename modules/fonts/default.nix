{ pkgs, ... }:
let
  nf = pkgs.nerd-fonts;
in
{
  home.packages = [
    nf.inconsolata
  ];
}
