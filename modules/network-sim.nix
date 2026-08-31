{ pkgs, ... }:

{
  imports = [
    ./packet-tracer.nix
  ];

  # To ensure Packet Tracer works correctly, we need to add it to systemPackages
  environment.systemPackages = with pkgs; [
    gns3-gui
  ];

}
