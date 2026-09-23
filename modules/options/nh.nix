{ inputs, pkgs, ... }:

# Nix package manager options and overlays
# This module configures Nix and Nixpkgs options, overlays, and related tools.
{

  # Enable nh (Nix Helper) for easier system management
  programs.nh = {
    enable = true; # Enable nh
    clean.enable = true; # Enable cleaning of old generations
    #clean.extraArgs = "--keep-since 7d --keep 8"; # Keep generations from last 7 days and 8 most recent
    clean.extraArgs = "--keep 10"; # Keep 10 most recent generations
  };

}
