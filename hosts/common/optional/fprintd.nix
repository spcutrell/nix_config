{config, ...}: {
  services.fprintd.enable = true;

  security.pam.services = {
    sudo.fprintAuth = config.services.fprintd.enable;
    polkit-1.fprintAuth = config.services.fprintd.enable;

    login.fprintAuth = false;
    gdm.fprintAuth = false;
    gdm-password.fprintAuth = false;
    gdm-fingerprint = {
      text = ''
        auth required pam_deny.so
        account required pam_deny.so
        password required pam_deny.so
        session required pam_deny.so
      '';
    };
  };
}
