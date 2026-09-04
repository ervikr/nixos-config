{config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "root" "daniel" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
