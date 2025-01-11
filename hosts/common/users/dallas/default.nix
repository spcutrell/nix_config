{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    # mutableUsers = true; #TURN THIS TO FALSE WHEN EVERYTHING IS 100%
    users.dallas = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      # shell = pkgs.fish;
      shell = pkgs.murex;
      initialPassword = "password";
      packages = [ pkgs.murex ];
    };
  };
}
