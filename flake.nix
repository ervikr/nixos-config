{
  description = "Daniel's config flake";

  # Define the inputs used for the flake
  inputs = {
    # Add nixpkgs input under the unstable channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Add nixpkgs-stable input for stable packages
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-26.05";

    # Lanzaboote for Secure Boot support
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, lanzaboote, home-manager, ... }@inputs:
    let
      # Import the variables from vars.nix
      # vars = import ./vars.nix;

      # Define a helper function to create NixOS configurations for each host
      # NOTE: system must be explicit for correctness
      mkNixOSConfig = system: path: extraModules:
        let
          pkgs-stable-import = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true; # Ensures unfree packages can be used in stable nixpkgs
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;

          # Pass inputs, vars, AND pkgs-stable to all modules
          specialArgs = {
            # inherit inputs vars;
            pkgs-stable = pkgs-stable-import;
          };




          # Define modules to be included for all hosts, and append any extra modules specific to the host
          modules = [
            path
            # sops-nix.nixosModules.sops

            # Allow unfree packages
            {
              nixpkgs.config.allowUnfree = true;
            }

            # Inject pkgs-stable into module args
            {
              _module.args.pkgs-stable = pkgs-stable-import;
            }
          ] ++ extraModules;
        };

    in {
      nixosConfigurations = {
        # School laptop configuration
        legend = mkNixOSConfig "x86_64-linux" ./hosts/legend/configuration.nix [
          lanzaboote.nixosModules.lanzaboote
        ];
    };
  };
}
