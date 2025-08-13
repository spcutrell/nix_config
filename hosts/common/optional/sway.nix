{ pkgs, ... }:
{
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

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraPackages = builtins.attrValues {
      inherit (pkgs)
        fuzzel
        grim
        mako
        slurp
        sway-audio-idle-inhibit
        wl-clipboard
        ;
    };
  };

}
