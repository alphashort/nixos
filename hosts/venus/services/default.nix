{
  imports = [
    ./containers
    ./sound.nix
    ./udev.nix
  ];
  services = {
    hypridle.enable = true;
    gvfs.enable = true;
    trezord.enable = true;
    gnome.gnome-keyring.enable = true;
    qdrant.enable = true;
    upower.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        addresses = true;
        workstation = true;
        userServices = true;
      };
    };
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
