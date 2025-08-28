{inputs, ...}: {
  flake.overlays.default = inputs.nixpkgs.lib.composeManyExtensions [
    inputs.niri.overlays.niri
  ];
}
