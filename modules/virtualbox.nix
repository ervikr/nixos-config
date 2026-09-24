{config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "root" "daniel" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Guest additions
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;
}
