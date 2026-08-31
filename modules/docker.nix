{ ... }:

{
  # Enable Docker
  virtualisation.docker = {
    enable = true;

    # Running docker in rootless mode
    rootless = {
      enable = true;
      setSocketVariable = true;
      # Optionally customize rootless Docker daemon settings
      daemon.settings = {
      data-root = "~/.local/docker";
      dns = [ "1.1.1.1" "8.8.8.8" ];
      registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };

}
