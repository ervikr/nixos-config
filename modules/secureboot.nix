{ lib, config, pkgs, pkgs-stable, ... }:

{
  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Lanzaboote
  boot.lanzaboote = {
    enable = true;
    #pkiBundle = "/etc/secureboot";  # Where keys will be stored
    pkiBundle = "/var/lib/sbctl";  # Where keys will be stored
    autoEnrollKeys = {
      enable = true; # Enable automatic key enrollment
      autoReboot = true;  # Reboot automatically after enrolling keys
    };
  };


  # Optional but recommended
  # boot.kernelParams = [
  #   "lockdown=integrity"
  # ];

  environment.systemPackages = with pkgs-stable; [
    sbctl  # Secure Boot control tool
  ];
}
