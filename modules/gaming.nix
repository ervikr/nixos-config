{ inputs, pkgs, pkgs-stable, ... }:

{
  # Add gaming related packages to system environment
  environment.systemPackages = [
    # From stable channel
    # pkgs-stable.modrinth-app

    # Add Java JDK for minecraft
    # Available through symlink: /run/current-system/sw/bin/java
    #pkgs.jdk8
    #pkgs.jdk17
    #pkgs.jdk21
    # pkgs.jdk25
  ];



  # Steam
  programs.steam = {
    enable = true;
    fontPackages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];
    dedicatedServer.openFirewall = true; # Allow dedicated servers
    extraCompatPackages = [
      pkgs.proton-ge-bin # GE-Proton for better game compatibility
    ];
  };

}
