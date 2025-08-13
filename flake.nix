{
  description = "NixOS Config Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    idle-inhibit = {
      url = "github:rafaelrc7/wayland-pipewire-idle-inhibit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        {
          self',
          pkgs,
          system,
          ...
        }:
        {
          checks = {
            pre-commit-check = inputs.git-hooks-nix.lib.${system}.run {
              src = ./.;
              hooks = {
                nixfmt-rfc-style = {
                  enable = true;
                  settings.width = 110;
                };
                deadnix.enable = true;
                statix.enable = true;
              };
            };
          };
          devShells.default = pkgs.mkShell {
            inherit (self'.checks.pre-commit-check) shellHook;
            packages =
              with pkgs;
              [
                nil
                statix
                python311Packages.nix-prefetch-github
                nixos-generators
                graphviz
                deadnix
              ]
              ++ [
                pkgs.home-manager
              ];
          };
          formatter = pkgs.nixfmt-rfc-style;
        };
      flake = {
        nixosConfigurations =
          let
            mkSystem =
              {
                hostname,
                extraModules ? [ ],
              }:
              inputs.nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                  ./hosts/${hostname}
                  inputs.home-manager.nixosModules.home-manager
                  {
                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      extraSpecialArgs = { inherit inputs; };
                      sharedModules = [
                        ./modules
                      ];
                    };
                  }
                ] ++ extraModules;
              };
          in
          {
            nostromo = mkSystem {
              hostname = "nostromo";
            };
            narcissus = mkSystem {
              hostname = "narcissus";
              extraModules = [
                inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
              ];
            };
          };
      };
    };
}
