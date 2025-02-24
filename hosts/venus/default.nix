{
  imports = [
    ../common
    ./configuration.nix
    ./programs.nix
    ./services
  ];

  extraServices = {
    virtualisation.enable = true;
  };
}
