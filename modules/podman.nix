# Podman - An open source container tool - Alternative to docker
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs: [
    podman         # Container runtime
    podman-tui     # Terminal UI for Podman
    podman-compose # Docker Compose compatibility
  ]

  # Podman configuration for rootless containers
    virtualisation.podman = {
      enable = true;
      dockerCompat = true; # Docker compatibility
      defaultNetwork.settings.dns_enabled = true;
      # Create the default bridge network for podman
      defaultNetwork.settings.dns_enabled = true;
    };
}
