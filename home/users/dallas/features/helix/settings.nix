{ ... }: {
  stylix.targets.helix.enable = false;
  programs.helix.settings = {
    theme = "solarized_dark";

    editor = {
      scrolloff = 2;
      mouse = false;
      true-color = true;
      rulers = [ 80 ];
      auto-pairs = true;
      bufferline = "multiple";

      cursor-shape = {
        insert = "bar";
      };

      indent-guides = {
        render = true;
      };

      smart-tab = {
        enable = false;
      };
    };
  };
}
