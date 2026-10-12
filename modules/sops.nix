{ pkgs, ... }:

{
  # Install sops and required dependencies
  environment.systemPackages = with pkgs; [
    sops
    age
  ];

  # Enable sops-nix
  sops = {
    enable = true;
    # Default age key file - create with: age-keygen -o ~/.config/sops/age/keys.txt
    age.keyFile = "~/.config/sops/age/keys.txt";
  };
}
