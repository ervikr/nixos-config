{ pkgs, lib, ... }:

{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;  # enable copy and paste between host and guest

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" "d /var/lib/swtpm-localca 0755 tss tss -" ];

  environment.systemPackages = [ pkgs.swtpm ];

  # TPM 2.0 for Windows 11 install with no requirements skipping
  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true;  # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
  security.tpm2.tctiEnvironment.enable = true;  # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
  virtualisation.libvirtd.qemu.swtpm.enable = true;

  systemd.network = {
      netdevs.br0 = {
        netdevConfig = {
          Kind = "bridge";
        };
      };

      networks.br0 = {
        matchConfig.Name = "br0";
        networkConfig = {
          # Address = "192.168.122.1/24"; # Optional: Static IP for the bridge
          IPForward = true;
        };
      };
    };

    # Ensure the physical interface (e.g., eth0) is enslaved to the bridge
    systemd.network.networks."20-wlp3s0" = {
      matchConfig.Name = "wlp3s0"; # Replace with your physical interface
      networkConfig = {
        Bridge = "br0";
      };
    };

}
