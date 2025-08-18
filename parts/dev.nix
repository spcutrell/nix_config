{inputs, ...}: {
  imports = [
    inputs.git-hooks-nix.flakeModule
  ];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    pre-commit.settings = {
      src = ./.;
      hooks = {
        alejandra.enable = true;
        deadnix.enable = true;
      };
    };

    devShells.default = pkgs.mkShell {
      shellHook = config.pre-commit.installationScript;
      packages = with pkgs;
        [
          nil
          statix
          python311Packages.nix-prefetch-github
          nixos-generators
        ]
        ++ [
          pkgs.home-manager
        ];
    };
    formatter = pkgs.alejandra;
  };
}
