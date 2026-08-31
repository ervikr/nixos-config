{ config, lib, pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    vivaldi
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    languagePacks = [ "en-GB" "nb-NO" ];

    preferences = {
      "privacy.resistFingerprinting" = true;
    };

    policies = {
      DisableTelemetry = true;
    };
  };

  # Enable Lightweight selfhosted Firefox Send alternative without public upload
  # services.gokapi.enable = true;
}
