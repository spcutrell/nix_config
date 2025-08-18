{
  inputs,
  config,
  lib,
  ...
}: {
  options = {
    flake.hosts = lib.mkOption {
      type = with lib.types;
        attrsOf (submodule {
          options = {
            extraModules = lib.mkOption {
              type = listOf anything;
              default = [];
            };
            system = lib.mkOption {
              type = str;
              default = "x86_64-linux";
            };
          };
        });
      default = {};
    };
  };

  config = {
    flake.nixosConfigurations =
      lib.mapAttrs (
        hostname: hostConfig:
          inputs.nixpkgs.lib.nixosSystem {
            system = hostConfig.system;
            specialArgs = {inherit inputs;};
            modules =
              [
                (../hosts + "/${hostname}")
                inputs.home-manager.nixosModules.home-manager
                inputs.niri.nixosModules.niri
                {
                  nixpkgs.overlays = [inputs.niri.overlays.niri];
                  home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = {inherit inputs;};
                    sharedModules = [
                      ../modules
                    ];
                  };
                }
              ]
              ++ hostConfig.extraModules;
          }
      )
      config.flake.hosts;
  };
}
