{ ... }: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use ghostty as default terminal
      terminal = "ghostty"; 
      # startup = [
      #   # Launch Firefox on start
      #   {command = "firefox";}
      # ];
    };
  };
}
