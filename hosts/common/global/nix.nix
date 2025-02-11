{ ... }: {
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "dallas" ];
  };
  nixpkgs.config.allowUnfree = true;
}
