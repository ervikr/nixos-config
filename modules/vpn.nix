{ pkgs, ... }:

{
  # To ensure Packet Tracer works correctly, we need to add it to systemPackages
  environment.systemPackages = with pkgs; [
    proton-vpn
    wireguard-tools
  ];

}
