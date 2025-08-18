{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    # mutableUsers = true; #TURN THIS TO FALSE WHEN EVERYTHING IS 100%
    users.jonesy = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.fish;
      initialPassword = "password";
      packages = [pkgs.murex];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMwLOaGd5W8BdBqmLjirLCskjAxlo4Vra18hPYDpOmx nostromo"
      ];
    };
  };
}
