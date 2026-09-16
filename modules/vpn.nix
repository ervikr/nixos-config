{ pkgs, ... }:

{
  # To ensure Packet Tracer works correctly, we need to add it to systemPackages
  environment.systemPackages = with pkgs; [
    proton-vpn
    wireguard-tools
    openconnect-sso
  ];

  # networking.networkmanager.plugins = with pkgs; [
  #   networkmanager-openconnect
  # ];

  # networking.networkmanager.ensureProfiles.profiles.myVPN = {
  #   connection = { id = "NTNU VPN"; type = "vpn"; };
  #   vpn = {
  #     service-type = "org.freedesktop.NetworkManager.openconnect";
  #     gateway = "vpn.ntnu.no";
  #     protocol = "anyconnect";
  #   };
  # };

}
