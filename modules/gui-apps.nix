{ pkgs, ... }:

{
  # To ensure Packet Tracer works correctly, we need to add it to systemPackages
  environment.systemPackages = with pkgs; [
    readest
    obsidian
    discord
    element-desktop
    spotify
    localsend
    vlc
  ];

}
