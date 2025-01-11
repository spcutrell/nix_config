let
  elixir = import ./elixir.nix;
  python = import ./python.nix;
in {
  language = elixir.language ++ python.language;
}
