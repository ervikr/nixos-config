{ pkgs, ... }:

{
  # To ensure Packet Tracer works correctly, we need to add it to systemPackages
  environment.systemPackages = with pkgs; [
    proton-vpn
    wireguard-tools
    wireguard-ui
    openconnect-sso
  ];

  # Enable Wireguard
    networking.wg-quick.interfaces = {
      # "wg0" is the network interface name. You can name the interface arbitrarily.
      wg0 = {
        # Determines the IP address and subnet of the client's end of the tunnel interface.
        address = [ "192.168.1.4/32" ];

        dns = "192.168.1.1";

        # Path to the private key file.
        #
        # Note: The private key can also be included inline via the privateKey option,
        # but this makes the private key world-readable; thus, using privateKeyFile is
        # recommended.
        privateKeyFile = "/private/wireguard-keys";

        peers = [
          # For a client configuration, one peer entry for the server will suffice.
          {
            # Public key of the server (not a file path).
            publicKey = "qP63ZbGj8CET30NSPvH5Rj+Ms0pM6MrpgeMI0P4hxww=";

            # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
            # For a server peer this should be the whole subnet.
            allowedIPs = [ "0.0.0.0/0" ];

            # Set this to the server IP and port.
            endpoint = "46.249.254.211:51820";

            # Send keepalives every 25 seconds. Important to keep NAT tables alive.
            persistentKeepalive = 25;
          }
        ];
      };
    };


}
