{ pkgs, ... }:

{
  imports = [
    ./packet-tracer.nix
  ];

  environment.systemPackages = with pkgs; [
    gns3-gui
  ];

}
