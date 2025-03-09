{ pkgs, ... }: {
  # TODO: Pull this out into its own module
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --remember \
            --remember-user-session \
            --asterisks \
            --cmd sway
        '';
        user = "greeter";
      };
    };
  };

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      grim
      slurp
      wl-clipboard
      mako
      fuzzel
      ;
  };

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

}
