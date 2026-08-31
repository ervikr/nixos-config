{ config, lib, pkgs, pkgs-stable, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;

    # Default display manager for Plasma
    displayManager.plasma-login-manager.enable = true;

    # Optionally enable xserver
    xserver.enable = true;
    xserver.xkb.layout = "no";
  };
}
